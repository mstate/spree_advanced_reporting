class Spree::AdvancedReport::IncrementReport::Tax < Spree::AdvancedReport::IncrementReport
  def name
    "Tax Report"
  end

  def description
    "Tax report for orders"
  end

  def initialize(params)
    super(params)

    self.ruportdata = INCREMENTS.inject({}) { |h, inc| h[inc] = Table(%w[key display tax_low tax_high]); h }
    self.data = INCREMENTS.inject({}) { |h, inc| h[inc] = {}; h }

    self.total = 0
    self.orders.each do |order|
      date = {}
      INCREMENTS.each do |type|
        date[type] = get_bucket(type, order.completed_at)
        data[type][date[type]] ||= {
          :tax_low => 0,
          :tax_high => 0,
          :display => get_display(type, order.completed_at),
        }
      end
      tax = tax(order)

      INCREMENTS.each do |type|
        data[type][date[type]][:tax_low] += tax["low"]
        data[type][date[type]][:tax_high] += tax["high"]
      end
    end

    generate_ruport_data

    INCREMENTS.each { |type| ruportdata[type].replace_column("tax_low") { |r| "%0.2f #{Spree::Config[:currency]}" % r["tax_low"] } }
    INCREMENTS.each { |type| ruportdata[type].replace_column("tax_high") { |r| "%0.2f #{Spree::Config[:currency]}" % r["tax_high"] } }
  end

  def generate_ruport_data
    self.all_data = Table(%w[increment key display tax_low tax_high])
    INCREMENTS.each do |inc|
      data[inc].each { |k,v| ruportdata[inc] << { "key" => k, "display" => v[:display], "tax_low" => v[:tax_low], "tax_high" => v[:tax_high] } }
      ruportdata[inc].data.each do |p|
        self.all_data << {"increment" => inc.to_s.capitalize, "key" => p.data["key"], "display" => p.data["display"], "tax_low" => p.data["tax_low"], "tax_high" => p.data["tax_high"]}
      end
      ruportdata[inc].sort_rows_by!(["key"])
      ruportdata[inc].remove_column("key")
      ruportdata[inc].rename_column("display", dates[inc][:header_display])
    end
    self.all_data.sort_rows_by!(["key"])
    self.all_data.remove_column("key")
    self.all_data = Grouping(self.all_data, :by => "increment")
  end
end
