class Spree::AdvancedReport::IncrementReport < Spree::AdvancedReport
  INCREMENTS = [:daily, :weekly, :monthly, :quarterly, :yearly]
  attr_accessor :increments, :dates, :total, :all_data

  def initialize(params)
    super(params)

    self.increments = INCREMENTS
    self.ruportdata = INCREMENTS.inject({}) { |h, inc| h[inc] = Table(%w[key display value]); h }
    self.data = INCREMENTS.inject({}) { |h, inc| h[inc] = {}; h }

    self.dates = {
      :daily => {
        :date_bucket => "%F",
        :date_display => I18n.t(:daily, scope: [:adv_report, :date_display]),
        :header_display => 'Daily',
      },
      :weekly => {
        :header_display => 'Weekly'
      },
      :monthly => {
        :date_bucket => "%Y-%m",
        :date_display => I18n.t(:monthly, scope: [:adv_report, :date_display]),
        :header_display => 'Monthly',
      },
      :quarterly => {
        :header_display => 'Quarterly'
      },
      :yearly => {
        :date_bucket => "%Y",
        :date_display => I18n.t(:yearly, scope: [:adv_report, :date_display]),
        :header_display => 'Yearly',
      }
    }
  end

  def generate_ruport_data
    self.all_data = Table(%w[increment key display value])
    INCREMENTS.each do |inc|
      data[inc].each { |k,v| ruportdata[inc] << { "key" => k, "display" => v[:display], "value" => v[:value] } }
      ruportdata[inc].data.each do |p|
        self.all_data << { "increment" => inc.to_s.capitalize, "key" => p.data["key"], "display" => p.data["display"], "value" => p.data["value"] }
      end
      ruportdata[inc].sort_rows_by!(["key"])
      ruportdata[inc].remove_column("key")
      ruportdata[inc].rename_column("display", dates[inc][:header_display])
      ruportdata[inc].rename_column("value", self.class.name.split('::').last)
    end
    self.all_data.sort_rows_by!(["key"])
    self.all_data.remove_column("key")
    self.all_data = Grouping(self.all_data, :by => "increment")
  end

  def get_bucket(type, completed_at)
    if type == :weekly
      return datepicker_field_value(completed_at.beginning_of_week)
    elsif type == :quarterly
      return datepicker_field_value(completed_at.beginning_of_quarter)
    end
    completed_at.strftime(dates[type][:date_bucket])
  end

  def get_display(type, completed_at)
    if type == :weekly
      #funny business
      #next_week = completed_at + 7
      return datepicker_field_value(completed_at.beginning_of_week)
    elsif type == :quarterly
      return completed_at.strftime("%Y") + ' Q' + (completed_at.beginning_of_quarter.strftime("%m").to_i/3 + 1).to_s
    end
    completed_at.strftime(dates[type][:date_display])
  end

  def format_total
    self.total
  end
end
