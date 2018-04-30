When("I click on a product category") do
    demo_homepage.hover_product_categories
    demo_homepage.select_category_by_name("Accessories")
end

Then("I should get a list of items that match the category") do
    expect(demo_checkout.check_url.path).to include 'accessories'
    expect(demo_category.find_category_name_and_product_name).to eq "Magic Mouse"
end

Given("I am on the product category page") do
    demo_homepage.visit_homepage
    demo_homepage.hover_product_categories
    demo_homepage.select_category_by_name("iMacs")
end

When("I click on Add item") do
    demo_category.click_add_button(0)
    wait_time(5)
end

Then("I should see the item count in the basket increment") do
    expect(demo_category.find_checkout_number).to be > 0
end

When("I click on a blog post") do
    demo_homepage.click_blog_post
end

Then("I should view the correct blog post") do
    demo_category.view_product_category_from_blog_post
end

When('I select grid view') do
    demo_category.grid_view
end

Then('the product should be displayed in the grid view') do
    demo_category.view_grid_view
    expect(demo_category.check_view_title).to eq 'Accessories'
    expect(demo_category.check_item_in_grid).to eq '132px'
end

When('I select list view') do
    demo_category.list_view
end

Then('the product should be displayed in the list view') do
    demo_category.view_list_view
    expect(demo_category.check_view_title).to eq 'Accessories'
    expect(demo_category.check_item_in_list).to eq '660px'
end
