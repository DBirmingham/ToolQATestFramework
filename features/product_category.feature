Feature: Category Add item

    @test1
    Scenario: If I select the product category I should be able to see the list of items from that category.

        Given I am on the home page.
        When I click on a product category.
        Then I should get a list of items that match the category.

    @test2
    Scenario: If I add items to the basket then the basket counter should increment by one and the item should be in the basket.

        Given I on the product category page.
        When I click on Add item.
        Then I should see the item count in the basket increment.

