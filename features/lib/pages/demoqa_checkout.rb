require 'capybara/dsl'

class Checkout
	include Capybara::DSL

	attr_accessor :quantity

	EMPTY_BASKET_MESSAGE = "div.entry-content"
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

	def check_checkout_error_message
    	find(:css, EMPTY_BASKET_MESSAGE).text
  	end

	def click_checkout_your_cart_continue_button
		find('span', text: CHECKOUT_PROGRESS_INFO).click
	end

	def click_checkout_info_purchase_button
		click_button(CHECKOUT_PROGRESS_FINAL)
	end

	def email_error_message
		find('span', text: EMAIL_MESSAGE).text
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

	def select_product(index_of_item)
		class_of_item = "wpsc_product_name_#{index_of_item}"
		within(:css, "td.#{class_of_item}") do
			find('a').click
		end
	end

	def update_quantity(index_of_item, new_quantity)
		@quantity = new_quantity
		selected_item = "wpsc_product_quantity_#{index_of_item}"

		within(:css, "td.#{selected_item}") do
			find(:css, "input[name$='quantity']").set(new_quantity)
		end
	end

	def save_update(index_of_item)
		selected_item = "wpsc_product_quantity_#{index_of_item}"
		within(:css, "td.#{selected_item}") do 
			find("input[type='submit']").click
		end
	end

	def get_total_price_of_item(index_of_item)
		selected_item = "product_row_#{index_of_item}"
		within(:css, "tr.#{selected_item}") do
			within(:css, "td.wpsc_product_price_#{index_of_item}") do
				@total = find(:css, "span.pricedisplay").text
			end
		end
		@total.gsub!('$', '').to_f
	end

	def get_price_of_item(index_of_item)
		selected_item = "product_row_#{index_of_item}"
		within(:css, "tr.#{selected_item}") do
			@price = find(:css, "span.pricedisplay").text
		end
		@price.gsub!('$', '').to_f
	end

	def remove_item(index_of_item)
		selected_item = "wpsc_product_remove_#{index_of_item}"
		within(:css, "td.#{selected_item}") do 
			find("input[type='submit']").click
		end
	end

	def get_empty_basket_message
		find(:css, EMPTY_BASKET_MESSAGE).text
	end

	def item_list
		array = []
		page.all(:css, "td.wpsc_product_name").each do |item|
			within(item) do
				array << find('a').text
			end
		end
		array
	end

	def check_url
		URI.parse(current_url)
	end

	def get_item_name(index_of_item)
		selected_item = "wpsc_product_name_#{index_of_item}"
		within(:css, "td.#{selected_item}") do
			@item_name = find('a').text
		end
		@item_name.downcase!.gsub!(' ', '-')
	end

end