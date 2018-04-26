Feature: DemoHomepage
	@hoem
	Scenario: Navigating to the home page
		Given I visit the homepage
		Then I am on the homepage

	Scenario: Navigating to the cart
		Given I visit the homepage
		When I click on the checkout cart
		Then I am on the cart page

	Scenario: Navigating to the accessories page
		Given I visit the homepage
		When I hover over Products Categories and I click on the categories list option
		Then I am on the accessories page
