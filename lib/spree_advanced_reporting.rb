require 'spree_core'
require 'ruport'
require 'spree_advanced_reporting/engine'

module SpreeAdvancedReporting
  mattr_accessor :default_min_date

  def self.default_min_date
    @default_min_date ||= Time.now - 30.days
  end
end
