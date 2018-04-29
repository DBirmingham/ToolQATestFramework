require 'capybara/dsl'

class Homepage
	include Capybara::DSL

	attr_accessor :homepage_url, :product_category_link_text, :checkout_cart_link_text, :my_account_link_text, :all_products_link_text, :blog_post_link_text

	def initialize
		@homepage_url = 'http://store.demoqa.com/'
		@product_category_link_text = 'Product Category'
		@checkout_cart_link_text = 'Checkout'
		@my_account_link_text = 'My Account'
		@all_products_link_text = 'All Product'
		@blog_post_link_text = 'More Details'
	end

	def visit_homepage
		visit(@homepage_url)
	end

	def click_blog_post
		 click_link(@blog_post_link_text)
 	end

	def click_on_product_category
		click_link(@product_category_link_text)
	end

	def click_on_my_account_button
		click_link(@my_account_link_text)
	end

	def visit_checkout_cart
		click_link(@checkout_cart_link_text)
	end

	def click_on_all_products_button
		click_link(@all_products_link_text)
	end

	def hover_product_categories
		find_link(@product_category_link_text).hover
	end

	def select_category_by_name category
		click_link(category)
	end

	def check_url
		URI.parse(current_url)
	end

end
