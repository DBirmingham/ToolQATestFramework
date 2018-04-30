Given("I visit the DemoQA homepage") do
  	demo_homepage.visit_homepage
end

Then("I am on the DemoQA homepage") do
  	expect(demo_homepage.check_url.path).to eq '/'
  	expect(demo_homepage.check_url.host).to eq 'store.demoqa.com'
end

When("I click on the checkout cart") do
  	demo_homepage.visit_checkout_cart
end

Then("I am on the cart page") do
  	expect(demo_checkout.check_url.path).to include 'checkout'
end

When("I hover over Products Categories and I click on the categories list option") do
  	demo_homepage.hover_product_categories
  	demo_homepage.select_category_by_name("Accessories")
end

Then("I am on the accessories page") do
  	expect(demo_checkout.check_url.path).to include 'accessories'
end
