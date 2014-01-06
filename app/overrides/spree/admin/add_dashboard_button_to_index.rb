Deface::Override.new(
  :virtual_path  => "spree/admin/reports/index",
  :name          => "report_dashboard_button",
  :insert_before => '[class="index"]',
  :partial       => "spree/admin/reports/dashboard_button",
  :disabled      => false
)