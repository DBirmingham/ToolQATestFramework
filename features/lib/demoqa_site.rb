require_relative 'pages/demoqa_homepage'
require_relative 'pages/demoqa_checkout'
require_relative 'pages/demoqa_category'

module DemoSite

	def homepage
		Homepage.new
	end

	def checkout
		Checkout.new
	end

<<<<<<< HEAD
	def category_add
		DemoQaCategory.new
	end

=======
	def category
		DemoQaCategory.new
	end
>>>>>>> auto_category_add_item
end