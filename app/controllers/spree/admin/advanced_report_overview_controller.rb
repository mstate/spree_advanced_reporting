class Spree::Admin::AdvancedReportOverviewController < Spree::Admin::BaseController
  def index
    # @reports = Spree::Admin::ReportsController::ADVANCED_REPORTS
    @products = Spree::Product.all
    @taxons = Spree::Taxon.all
    if defined?(SpreeMultiDomain)
      @stores = Spree::Store.all
    end
    @report = Spree::AdvancedReport::IncrementReport::Revenue.new({ search: {} })
    @top_products_report = Spree::AdvancedReport::TopReport::TopProducts.new({ search: {} }, 5)
    @top_customers_report = Spree::AdvancedReport::TopReport::TopCustomers.new({ search: {} }, 5)
    @top_customers_report.ruportdata.remove_column("Units")

    # From overview_dashboard, Cleanup eventually
    @last_orders = Spree::Order
      .where.not(completed_at: nil)
      .order(completed_at: :desc)
      .limit(10)
      .includes(:line_items)
  end
end
