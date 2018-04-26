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

	def category
		DemoQaCategory.new
	end

end