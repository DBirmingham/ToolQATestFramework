require_relative 'pages/demoqa_homepage'
require_relative 'pages/demoqa_checkout'


module DemoSite

	def homepage
		Homepage.new
	end

	def checkout
		Checkout.new
	end

end