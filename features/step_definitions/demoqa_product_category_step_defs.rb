When("I click on a product category") do
    @demo_homepage = demo_homepage
    @demo_homepage.hover_product_categories
    @demo_homepage.select_random_category
    @product_cat = @demo_homepage.selected_category
end

Then("I should get a list of items that match the category") do
    expect(category.check_url).to include @product_cat.downcase
    expect(category.check_if_on_a_product_cat_page).to eq @product_cat
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
    @post = homepage.get_name_of_blog_post(2)
    homepage.click_blog_post(2)
  end

Then("I should view the correct blog post") do
    expect(category.get_blog_post_title).to eq @post
end

When('I select grid view') do
    demo_category.grid_view
end

Then('the product should be displayed in the grid view') do
    demo_category.view_grid_view
    expect(demo_category.check_view_title).to eq @product_cat
    expect(demo_category.check_item_in_grid).to eq '132px'
end

When('I select list view') do
    demo_category.list_view
end

Then('the product should be displayed in the list view') do
    demo_category.view_list_view
    expect(demo_category.check_view_title).to eq @product_cat
    expect(demo_category.check_item_in_list).to eq '660px'
end
