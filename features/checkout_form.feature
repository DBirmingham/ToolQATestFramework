Feature: CheckoutFormError

	@checkoutb
	Scenario: Testing the error message in an empty cart
		Given I am on the demo home page
		When I check the cart
		Then I should get the correct error message

	@checkouts
	Scenario: Testing the error messages in the purchase form
		Given I am on the demo home page
		And I add an item to cart
		When I submit the form
		And I got back to the checkout form
		Then I should receive the correct error message
		