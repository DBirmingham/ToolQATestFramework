Feature: Product view

  @product_view_grid
  Scenario: If I click on grid view on a product page the items should be displayed correctly in grid view.

    Given I am on the product category page
    And I am in the list view list
    When I select grid view
    Then the product should be displayed in the grid view

  @product_view_list
  Scenario: If I click on list view on a product page the items should be displayed correctly in list view.

    Given I am on the product category page
    And I am in the grid view list
    When I select list view
    Then the product should be displayed in the list view
