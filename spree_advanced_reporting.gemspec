# -*- encoding: utf-8 -*-
# stub: spree_advanced_reporting 4.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "spree_advanced_reporting"
  s.version = "4.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["L. Doubrava"]
  s.date = "2014-10-14"
  s.email = "luis@cg.nl"
  s.files = ["README.md", "app/assets", "app/assets/images", "app/assets/images/admin", "app/assets/images/admin/spree_advanced_reporting", "app/assets/images/admin/spree_advanced_reporting/asc.gif", "app/assets/images/admin/spree_advanced_reporting/barchart.png", "app/assets/images/admin/spree_advanced_reporting/bg.gif", "app/assets/images/admin/spree_advanced_reporting/close.png", "app/assets/images/admin/spree_advanced_reporting/desc.gif", "app/assets/images/admin/spree_advanced_reporting/menu-current-opposite.png", "app/assets/images/admin/spree_advanced_reporting/open.png", "app/assets/images/admin/spree_advanced_reporting/save.png", "app/assets/images/admin/spree_advanced_reporting/search.png", "app/assets/images/admin/spree_advanced_reporting/usa.png", "app/assets/images/admin/spree_advanced_reporting/world.png", "app/assets/javascripts", "app/assets/javascripts/admin", "app/assets/javascripts/admin/jquery.tablesorter.min.js", "app/assets/javascripts/admin/spree_advanced_reporting.js", "app/assets/stylesheets", "app/assets/stylesheets/admin", "app/assets/stylesheets/admin/spree_advanced_reporting.scss.erb", "app/controllers", "app/controllers/spree", "app/controllers/spree/admin", "app/controllers/spree/admin/advanced_report_overview_controller.rb", "app/controllers/spree/admin/reports_controller_decorator.rb", "app/helpers", "app/helpers/advanced_report_overview_helper.rb", "app/helpers/spree", "app/helpers/spree/admin", "app/helpers/spree/admin/advanced_report_helper.rb", "app/models", "app/models/ruport", "app/models/ruport/formatter", "app/models/ruport/formatter/html_decorator.rb", "app/overrides", "app/overrides/spree", "app/overrides/spree/admin", "app/overrides/spree/admin/add_dashboard_button_to_index.rb", "app/views", "app/views/spree", "app/views/spree/admin", "app/views/spree/admin/advanced_report_overview", "app/views/spree/admin/advanced_report_overview/index.html.erb", "app/views/spree/admin/reports", "app/views/spree/admin/reports/_advanced_report_criteria.html.erb", "app/views/spree/admin/reports/_dashboard_button.html.erb", "app/views/spree/admin/reports/geo_base.html.erb", "app/views/spree/admin/reports/increment_base.html.erb", "app/views/spree/admin/reports/outstanding.html.erb", "app/views/spree/admin/reports/top_base.html.erb", "lib/advanced_reporting_hooks.rb", "lib/spree", "lib/spree/advanced_report", "lib/spree/advanced_report.rb", "lib/spree/advanced_report/geo_report", "lib/spree/advanced_report/geo_report.rb", "lib/spree/advanced_report/geo_report/geo_profit.rb", "lib/spree/advanced_report/geo_report/geo_revenue.rb", "lib/spree/advanced_report/geo_report/geo_units.rb", "lib/spree/advanced_report/increment_report", "lib/spree/advanced_report/increment_report.rb", "lib/spree/advanced_report/increment_report/count.rb", "lib/spree/advanced_report/increment_report/profit.rb", "lib/spree/advanced_report/increment_report/revenue.rb", "lib/spree/advanced_report/increment_report/units.rb", "lib/spree/advanced_report/top_report", "lib/spree/advanced_report/top_report.rb", "lib/spree/advanced_report/top_report/top_customers.rb", "lib/spree/advanced_report/top_report/top_products.rb", "lib/spree_advanced_reporting", "lib/spree_advanced_reporting.rb", "lib/spree_advanced_reporting/engine.rb"]
  s.homepage = "https://github.com/cgservices/spree_advanced_reporting"
  s.required_ruby_version = Gem::Requirement.new(">= 1.8.7")
  s.requirements = ["none"]
  s.rubygems_version = "2.2.2"
  s.summary = "Advanced Reporting for Spree based on spree_advanced_reporting from Steph Skardal at www.endpoint.com"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<spree_core>, ["~> 2.3.0"])
      s.add_runtime_dependency(%q<ruport>, [">= 1.6.3"])
      s.add_runtime_dependency(%q<ruport-util>, [">= 0"])
    else
      s.add_dependency(%q<spree_core>, ["~> 2.3.0"])
      s.add_dependency(%q<ruport>, [">= 1.6.3"])
      s.add_dependency(%q<ruport-util>, [">= 0"])
    end
  else
    s.add_dependency(%q<spree_core>, ["~> 2.3.0"])
    s.add_dependency(%q<ruport>, [">= 1.6.3"])
    s.add_dependency(%q<ruport-util>, [">= 0"])
  end
end
