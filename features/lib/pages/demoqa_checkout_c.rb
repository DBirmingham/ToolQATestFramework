require 'capybara/dsl'

class CheckoutC
	include Capybara::DSL

	CHECKOUT_PROGRESS_INFO = 'step2'
	CHECKOUT_PROGRESS_FINAL = 'input-button-buy'
	EMAIL_MESSAGE = 'email'
	FIRST_NAME_MESSAGE = 'first name'
	LAST_NAME_MESSAGE = 'last name'
	ADDRESS_MESSAGE = 'address'
	CITY_MESSAGE = 'city'
	COUNTRY_MESSAGE = 'country'
	PHONE_MESSAGE = 'phone'
	ERROR_FIELD_MESSAGE = 'wpsc_error_msg_field_name'

	def click_checkout_your_cart_continue_button
		click_button(CHECKOUT_PROGRESS_INFO)
	end

	def click_checkout_info_purchase_button
		click_button(CHECKOUT_PROGRESS_FINAL)
	end

	def click_checkout_info_purchase_button
		click_button(CHECKOUT_PROGRESS_FINAL)
	end

	def email_error_message
		page.find('div', text: EMAIL_MESSAGE)
	end

	def first_name_error_message
		page.find('div', text: FIRST_NAME_MESSAGE)
	end

	def last_name_error_message
		page.find('div', text: LAST_NAME_MESSAGE)
	end

	def address_error_message
		page.find('div', text: ADDRESS_MESSAGE)
	end

	def city_error_message
		page.find('div', text: CITY_MESSAGE)
	end

	def country_error_message
		page.find('div', text: COUNTRY_MESSAGE)
	end

	def phone_error_message
		page.find('div', text: PHONE_MESSAGE)
	end
end