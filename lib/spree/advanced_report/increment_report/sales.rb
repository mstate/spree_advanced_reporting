class Spree::AdvancedReport::IncrementReport::Sales < Spree::AdvancedReport::IncrementReport
  def name
    "Sales Report"
  end

  def column
    "Count"
  end

  def description
    "Sales report for orders"
  end

  def initialize(params)
    super(params)

    self.ruportdata = INCREMENTS.inject({}) { |h, inc| h[inc] = Table(%w[key display count multi_store revenue profit]); h }
    self.data = INCREMENTS.inject({}) { |h, inc| h[inc] = {}; h }

    self.total = 0
    self.orders.each do |order|
      date = {}
      INCREMENTS.each do |type|
        date[type] = get_bucket(type, order.completed_at)
        data[type][date[type]] ||= {
          :count => 0,
          :multi_store => 0,
          :revenue => 0,
          :profit => 0,
          :display => get_display(type, order.completed_at),
        }
      end
      order_count = order_count(order)
      order_multi_store_count = multi_store_order_count(order)
      order_revenue = revenue(order)
      order_profit = profit(order)
      INCREMENTS.each do |type|
        data[type][date[type]][:count] += order_count
        data[type][date[type]][:multi_store] += order_multi_store_count
        data[type][date[type]][:revenue] += order_revenue
        data[type][date[type]][:profit] += order_profit
      end
      self.total += order_count
    end

    generate_ruport_data

    INCREMENTS.each { |type| ruportdata[type].replace_column("revenue") { |r| "%0.2f #{Spree::Config[:currency]}" % r["revenue"] } }
    INCREMENTS.each { |type| ruportdata[type].replace_column("profit") { |r| "%0.2f #{Spree::Config[:currency]}" % r["profit"] } }
  end

  def generate_ruport_data
    self.all_data = Table(%w[increment key display count multi_store revenue profit])
    INCREMENTS.each do |inc|
      data[inc].each { |k,v| ruportdata[inc] << { "key" => k, "display" => v[:display], "count" => v[:count], "multi_store" => v[:multi_store], "revenue" => v[:revenue], "profit" => v[:profit] } }
      ruportdata[inc].data.each do |p|
        self.all_data << { "increment" => inc.to_s.capitalize, "key" => p.data["key"], "display" => p.data["display"], "count" => p.data["count"], "multi_store" => p.data["multi_store"], "revenue" => p.data["revenue"], "profit" => p.data["profit"] }
      end
      ruportdata[inc].sort_rows_by!(["key"])
      ruportdata[inc].remove_column("key")
      ruportdata[inc].rename_column("display", dates[inc][:header_display])
      #ruportdata[inc].rename_column("value", self.class.name.split('::').last)
    end
    self.all_data.sort_rows_by!(["key"])
    self.all_data.remove_column("key")
    self.all_data = Grouping(self.all_data, :by => "increment")
  end
end
