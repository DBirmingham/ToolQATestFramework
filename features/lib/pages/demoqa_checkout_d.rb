require 'capybara/dsl'

class CheckoutD
	include Capybara::DSL 

	EMPTY_BASKET_MESSAGE = "entry-content"


	# CHECKOUT PAGE - SHOW PRODUCT DETAILS
	def select_product(index_of_item)
		class_of_item = "wpsc_product_name_#{index_of_item}"
		click_link(class_of_item)
	end

	# CHECKOUT PAGE - UPDATE QUANTITY
	def update_quantity(index_of_item, new_quantity)
		selected_item = "wpsc_product_quantity_#{index_of_item}"

		within(:css, "td.#{selected_item}") do
			find(:css, "input[name$='quantity']").set(new_quantity)
		end
	end

	def save_update(index_of_item)
		selected_item = "wpsc_product_quantity_#{index_of_item}"
		within(:css, "td.#{selected_item}") do 
			click('submit')
		end
	end

	def get_total_price_of_item(index_of_item)
		selected_item = "wpsc_product_price_#{index_of_item}"
		within(:css, selected_item) do
			find(:css, "span").text
		end

	end

	# CHECKOUT PAGE - REMOVE ITEM
	def remove_item(index_of_item)
		selected_item = "wpsc_product_remove_#{index_of_item}"
		within(:css, "td.#{selected_item}") do 
			click('submit')
		end
	end

	# CHECKOUT PAGE - NO ITEM IN THE BASKET MESSAGE
	def get_empty_basket_message
		find(:css, EMPTY_BASKET_MESSAGE).text
	end

end