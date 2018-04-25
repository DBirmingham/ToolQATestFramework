require 'capybara/dsl'

class Homepage
	include Capybara::DSL

	HOMEPAGE_URL = 'http://store.demoqa.com/'

	def visit_homepage
		visit(HOMEPAGE_URL)
	end

end