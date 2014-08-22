# NOTES:

This branch is for use with Spree 2.3 and later.
2.x related changes:

1. Translation keys changed/fixed
2. Initialy only show last 30 days for reports
3. Fix date display
4. Use product cost price if variant cost price in empty
5. Add sales and tax reports
6. Exclude tax form cost_price
7. Overall refactoring
8. Optimize number queries

1.3-related changes:

1. Change the I18 default locale to use the Rails setting
2. Rework the GUI to work better with the new 1.3 admin GUI (this is a work in progress - it is functional at the moment, but certainly not pretty)

### Earlier changes

Forked from what appeared to the be the most up to date for, and made the following general changes:

1. Removed PDF generation, which isn't working under Ruby 1.9.x
2. Removed the route that overrides the main admin overview page
3. Fixed a warning about ```ADVANCED_REPORTS``` being redefined
4. Fixed the en.yml translation lookups


# Note
This extension seems in flux, having many forks, but no official rails3 update.

# Advanced Reporting

Advanced reporting for Spree.

## Includes:
* Base reports of Revenue, Units, Profit into Daily, Weekly, Monthly, and Yearly increments
* Geo reports of Revenue, Units divided into states and countries
* Two "top" reports for top products and top customers
* The ability to limit reports by order date, "store" (multi-store extension), product, and taxon.
* The ability to export data in PDF or CSV format.

## Dependencies:
* Ruport and Ruport-util
* Google Visualization
