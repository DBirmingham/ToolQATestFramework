Given("I visit the homepage") do
  homepage.visit_homepage
end

When("I click on the Product Category button") do
  homepage.click_on_product_category
end

When("I click on the checkout cart") do
  homepage.visit_checkout_cart
end

When("I click on the My Account button") do
  homepage.click_on_my_account_button
end

When("I click on the All Product button") do
  homepage.click_on_all_products_button
end

When("I click on a Blog post") do
  homepage.click_blog_post
end

When("I hover over Products Categories and I click on the categories list option") do
  homepage.hover_product_categories
  homepage.click_first_product_on_dropdown_menu
end

When("I hover over Products Categories and I click on the iMacs list option") do
  homepage.hover_product_categories
  homepage.click_second_product_on_dropdown_menu
end

When("I hover over Products Categories and I click on the iPads list option") do
  homepage.hover_product_categories
  homepage.click_third_product_on_dropdown_menu
end

When("I hover over Products Categories and I click on the iPhones list option") do
  homepage.hover_product_categories
  homepage.click_fourth_product_on_dropdown_menu
end

When("I hover over Products Categories and I click on the iPods list option") do
  homepage.hover_product_categories
  homepage.click_fith_product_on_dropdown_menu
end

When("I hover over Products Categories and I click on the MacBooks list option") do
  homepage.hover_product_categories
  homepage.click_sixth_product_on_dropdown_menu
end
