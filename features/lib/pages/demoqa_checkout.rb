require 'capybara/dsl'

class Checkout
	include Capybara::DSL

	EMPTY_BASKET_MESSAGE = "entry-content"
	CHECKOUT_PROGRESS_INFO = 'Continue'
	CHECKOUT_PROGRESS_FINAL = 'Purchase'
	EMAIL_MESSAGE = 'email'
	FIRST_NAME_MESSAGE = 'first name'
	LAST_NAME_MESSAGE = 'last name'
	ADDRESS_MESSAGE = 'address'
	CITY_MESSAGE = 'city'
	COUNTRY_MESSAGE = 'country'
	PHONE_MESSAGE = 'phone'
	ERROR_FIELD_MESSAGE = 'wpsc_error_msg_field_name'
	ERROR_MESSAGE = 'Oops, there is nothing in your cart.'

	def check_checkout_error_message
    	find('div', text: ERROR_MESSAGE).text
  	end

	def click_checkout_your_cart_continue_button
		find('span', text: CHECKOUT_PROGRESS_INFO).click
	end

	def click_checkout_info_purchase_button
		click_button(CHECKOUT_PROGRESS_FINAL)
	end

	def email_error_message
		page.find('div', text: EMAIL_MESSAGE)
	end

	def first_name_error_message
		find('span', text: FIRST_NAME_MESSAGE).text
	end

	def last_name_error_message
		find('span', text: LAST_NAME_MESSAGE).text
	end

	def address_error_message
		find('span', text: ADDRESS_MESSAGE).text
	end

	def city_error_message
		find('span', text: CITY_MESSAGE).text
	end

	def country_error_message
		find('span', text: COUNTRY_MESSAGE).text
	end

	def phone_error_message
		find('span', text: PHONE_MESSAGE).text
	end

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