require 'capybara/dsl'

class Checkout
	include Capybara::DSL

	# Generates an array of item names from the checkout page basket
	def item_list
		array = []
		within(:css, "td.wpsc_product_name") do
      		item = find('a').text
      		array << item
    	end
    	array
	end

end