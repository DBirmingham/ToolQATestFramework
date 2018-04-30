require 'capybara/dsl'

class Checkout
	include Capybara::DSL

	attr_accessor :quantity, :checkout_error_list

	def initialize
		@checkout_error_list = ["Please enter a valid email.", "Please enter a valid first name.", "Please enter a valid last name.", "Please enter a valid address.", "Please enter a valid city.", "Please enter a valid country.", "Please enter a valid phone."]
	end

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
	EMAIL_FIELD = 'wpsc_checkout_form_9'
	FIRST_NAME_FIELD = 'wpsc_checkout_form_2'
	LAST_NAME_FIELD = 'wpsc_checkout_form_3'
	ADDRESS_FIELD = 'wpsc_checkout_form_4'
	CITY_FIELD = 'wpsc_checkout_form_5'
	COUNTY_FIELD = 'wpsc_checkout_form_6'
	COUNTRY_DROPDOWN = 'wpsc_checkout_form_7'
	POSTAL_CODE = 'wpsc_checkout_form_8'
	PHONE_FIELD = 'wpsc_checkout_form_18'
	SHIPPING_ADDRESS = 'shippingSameBilling'
	CHECKOUT_CONFIRMATION = 'content_container'


	def check_checkout_error_message
    	find(:css, EMPTY_BASKET_MESSAGE).text
  	end

	def click_checkout_your_cart_continue_button
		find('span', text: CHECKOUT_PROGRESS_INFO).click
	end

	def click_checkout_info_purchase_button
		click_button(CHECKOUT_PROGRESS_FINAL)
	end

	def check_form_error_message
		errors = []
		page.all(:css, "p.validation-error").each do |error|
			errors << error.text
		end
		errors
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

	def fill_in_email(email_address)
		fill_in(EMAIL_FIELD, with: email_address)
	end

	def fill_in_first_name(firstname)
		fill_in(FIRST_NAME_FIELD, with: firstname)
	end

	def fill_in_last_name(lastname)
		fill_in(LAST_NAME_FIELD, with: lastname)
	end

	def fill_in_address(address)
		fill_in(ADDRESS_FIELD, with: address)
	end

	def fill_in_city(city)
		fill_in(CITY_FIELD, with: city)
	end

	def fill_in_county(county)
		fill_in(COUNTY_FIELD, with: county)
	end

	def fill_in_country(value)
		find(:id, COUNTRY_DROPDOWN).find(:xpath, value).click
	end

	def fill_in_post_code(post_code)
		fill_in(POSTAL_CODE, with: post_code)
	end

	def fill_in_phone(phone)
		fill_in(PHONE_FIELD, with: phone)
	end

	def fill_in_shipphing
		check(SHIPPING_ADDRESS)
	end

	def checkout_confirmation
		find_by_id(CHECKOUT_CONFIRMATION)
		 within(:css, 'div.wpsc-transaction-results-wrap') do
			 	find('p').text
			end
	end

end
