require 'capybara/dsl'

class Homepage
	include Capybara::DSL

	HOMEPAGE_URL = 'http://store.demoqa.com/'
	PRODUCT_CATEGORY = 'Product Category'
	CHECKOUT_CART = 'Checkout'
	FIRST_ITEM_ON_CATEGORY_LIST = 'Accessories'
	SECOND_ITEM_ON_CATEGORY_LIST = 'iMacs'
	THIRD_ITEM_ON_CATEGORY_LIST = 'iPads'
	FOURTH_ITEM_ON_CATEGORY_LIST = 'iPhones'
	FITH_ITEM_ON_CATEGORY_LIST = 'iPods'
	SIXTH_ITEM_ON_CATEGORY_LIST = 'MacBooks'
	MY_ACCOUNT = 'My Account'
	ALL_PRODUCTS = 'All Product'
	BLOG_POST_LINK = 'More Details'

	def visit_homepage
		visit(HOMEPAGE_URL)
	end

	def click_blog_post
		click_link(BLOG_POST_LINK)
 	end

	def click_on_product_category
		click_link(PRODUCT_CATEGORY)
	end

	def click_product_accessories
		click_link(FIRST_ITEM_ON_CATEGORY_LIST)
	end

	def click_on_my_account_button
		click_link(MY_ACCOUNT)
	end

	def visit_checkout_cart
		click_link(CHECKOUT_CART)
	end

	def click_on_all_products_button
		click_link(ALL_PRODUCTS)
	end

	def hover_product_categories
		find_link(PRODUCT_CATEGORY).hover
	end

	def click_first_product_on_dropdown_menu
		click_link(FIRST_ITEM_ON_CATEGORY_LIST)
	end

	def click_second_product_on_dropdown_menu
		click_link(SECOND_ITEM_ON_CATEGORY_LIST)
	end

	def click_third_product_on_dropdown_menu
		click_link(THIRD_ITEM_ON_CATEGORY_LIST)
	end

	def click_fourth_product_on_dropdown_menu
		click_link(FOURTH_ITEM_ON_CATEGORY_LIST)
	end

	def click_fith_product_on_dropdown_menu
		click_link(FITH_ITEM_ON_CATEGORY_LIST)
	end

	def click_sixth_product_on_dropdown_menu
		click_link(SIXTH_ITEM_ON_CATEGORY_LIST)
	end

	def check_url
		URI.parse(current_url)
	end

end
