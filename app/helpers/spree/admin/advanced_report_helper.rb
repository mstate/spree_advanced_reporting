module Spree
  module Admin
    module AdvancedReportHelper
      def datepicker_field_value(date)
        date.blank? ? nil : I18n.l(date, :format => I18n.t(:format, scope: [:date_picker]))
      end
    end
  end
end