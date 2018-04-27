require_relative 'pages/demoqa_homepage'
require_relative 'pages/demoqa_checkout'
require_relative 'pages/demoqa_category'
require_relative 'pages/demoqa_register'


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

	def register
		Register.new
	end

end