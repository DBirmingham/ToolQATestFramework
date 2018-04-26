Given("I am on the demo home page") do
  homepage.visit_homepage
end

And("I add an item to cart") do
  homepage.hover_product_categories
  homepage.click_fourth_product_on_dropdown_menu
  category.click_add_button
  sleep 5
end

When("I submit the form") do
  homepage.visit_checkout_cart
  checkout.click_checkout_your_cart_continue_button
  checkout.click_checkout_info_purchase_button
end

When("I check the cart") do
  homepage.visit_checkout_cart
end

And("I got back to the checkout form") do
  checkout.click_checkout_your_cart_continue_button
end

Then("I should receive the correct error message") do
  expect(checkout.email_error_message).to eq 'email'
  expect(checkout.first_name_error_message).to eq 'first name'
  expect(checkout.last_name_error_message).to eq 'last name'
  expect(checkout.address_error_message).to eq 'address'
  expect(checkout.city_error_message).to eq 'city'
  expect(checkout.country_error_message).to eq 'Please select a country'
  expect(checkout.phone_error_message).to eq 'phone'
end

Then ("I should get the correct error message") do
  expect(checkout.check_checkout_error_message).to eq 'Oops, there is nothing in your cart.'
end