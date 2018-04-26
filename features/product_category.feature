Feature: ProductCategory

@blogtest
Scenario: If I am on the home page and I select an item it should show the correct blog post.

	Given I am on the home page.
	When I click on a blog post.
	Then I should view the correct blog post.