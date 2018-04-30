

Given("I am on the home page.") do
    homepage.visit_homepage
end

When("I click on a product category.") do
    homepage.hover_product_categories
    homepage.select_category_by_name("Accessories")
end

Then("I should get a list of items that match the category.") do
    expect(category.find_category_name_and_product_name).to eq "Magic Mouse"
end

Given("I on the product category page.") do
    homepage.visit_homepage
    homepage.hover_product_categories
    homepage.select_category_by_name("iMacs")
  end

When("I click on Add item.") do
    category.click_add_button(0)
    sleep 5
end

Then("I should see the item count in the basket increment.") do
    expect(category.find_checkout_number).to be > 0
end

Given("I am on the home page.") do
  homepage.visit_homepage
end

When("I click on a blog post.") do
  homepage.click_blog_post
end

Then("I should view the correct blog post.") do
  category.view_product_category_from_blog_post
end

Given('I am on the product category page') do
  homepage.visit_homepage
  homepage.click_on_product_category
end

And('I am in the list view grid') do
  category.view_list_view
end

When('I select grid view') do
  category.grid_view
end

Then('the product should be displayed in the grid view') do
  category.view_grid_view
  expect(category.check_view_title).to eq 'Product Category'
  expect(category.check_item_in_grid).to eq '132px'
  expect(category.list_and_grid_items).to eq @view_items_list
end

And('I am in the list view list') do
  @category_list = category
  @category_list.view_list_view
  @view_items_list = @category_list.list_and_grid_items
end

And('I am in the grid view list') do
  @category_grid = category
  @category_grid.view_list_view
  @view_items_grid = @category_grid.list_and_grid_items
  category.grid_view
end

When('I select list view') do
  category.list_view
end

Then('the product should be displayed in the list view') do
  category.view_list_view
  expect(category.check_view_title).to eq 'Product Category'
  expect(category.check_item_in_list).to eq '660px'
  expect(category.list_and_grid_items).to eq @view_items_grid
end
