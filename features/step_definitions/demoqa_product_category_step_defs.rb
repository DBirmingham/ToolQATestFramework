

Given("I am on the home page.") do
    homepage.visit_homepage
end
  
When("I click on a product category.") do
    homepage.hover_product_categories
    homepage.click_first_product_on_dropdown_menu
end
  
Then("I should get a list of items that match the category.") do
    expect(category.find_category_name_and_product_name).to eq "Magic Mouse"
end

Given("I on the product category page.") do
    homepage.visit_homepage
    homepage.hover_product_categories
    homepage.click_second_product_on_dropdown_menu
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

