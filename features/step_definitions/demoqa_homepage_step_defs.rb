Given("I visit the homepage") do
  homepage.visit_homepage
end

When("I click on the checkout cart") do
  homepage.visit_checkout_cart
end

When("I hover over Products Categories and I click on the categories list option") do
  homepage.hover_product_categories
  homepage.click_first_product_on_dropdown_menu
end

Then("I am on the homepage") do
  expect(homepage.check_url.path).to eq '/'
  expect(homepage.check_url.host).to eq 'demoqa.com'
end

Then("I am on the cart page") do
  expect(checkout.check_url.path).to include 'checkout'
end

Then("I am on the accessories page") do
  expect(checkout.check_url.path).to include 'accessories'
end