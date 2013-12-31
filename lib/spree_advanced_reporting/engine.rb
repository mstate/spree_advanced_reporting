module SpreeAdvancedReporting
  class Engine < Rails::Engine
    require 'spree/core'
    isolate_namespace Spree
    engine_name 'spree_advanced_reporting'

    config.autoload_paths += %W(#{config.root}/lib)
    config.autoload_paths += Dir["#{config.root}/lib/**/"]

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), '../../app/**/*_decorator*.rb')) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end

    config.to_prepare &method(:activate).to_proc
  end
end

# module SpreeAdvancedReporting
#   class Engine < Rails::Engine
#     config.autoload_paths += %W(#{config.root}/lib)
#     def self.activate
#
#       Dir.glob(File.join(File.dirname(__FILE__), "../config/locales/*.yml")).each do |c|
#         I18n.load_path << File.expand_path(c)
#       end
#
#       Dir.glob(File.join(File.dirname(__FILE__), "../app/**/*_decorator.rb")).each do |c|
#         Rails.env.production? ? require(c) : load(c)
#       end
#
#       # Ruport::Controller::Table.formats.merge({ :flot => MyFlotFormatter })
#       # if Mime::Type.lookup_by_extension(:pdf) != 'application/pdf'
#       #   Mime::Type.register('application/pdf', :pdf)
#       # end
#
#       Ruport::Formatter::HTML.class_eval do
#         # Renders individual rows for the table.
#         def build_row(data = self.data)
#           @odd = !@odd
#           klass = @odd ? "odd" : "even"
#           output <<
#           "\t\t<tr class=\"#{klass}\">\n\t\t\t<td>" +
#             data.to_a.join("</td>\n\t\t\t<td>") +
#             "</td>\n\t\t</tr>\n"
#         end
#
#         def html_table
#           @odd = false
#           "<table class=\"tablesorter\">\n" << yield << "</table>\n"
#         end
#
#         def build_table_header
#           output << "\t<table class=\"tablesorter\">\n"
#           unless data.column_names.empty? || !options.show_table_headers
#             output << "\t\t<thead><tr>\n\t\t\t<th>" +
#               data.column_names.join("</th>\n\t\t\t<th>") +
#               "</th>\n\t\t</tr></thead>\n"
#           end
#         end
#       end
#     end
#
#     config.to_prepare &method(:activate).to_proc
#   end
# end