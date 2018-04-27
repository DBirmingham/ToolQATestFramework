Given("I am on the demo home page") do
  homepage.visit_homepage
end

And("I add an item to cart") do
  homepage.hover_product_categories
  homepage.click_fourth_product_on_dropdown_menu
  category.click_add_button 0
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
  expect(checkout.check_form_error_message).to eq checkout.checkout_error_list
end

Then ("I should get the correct error message") do
  expect(checkout.check_checkout_error_message).to eq 'Oops, there is nothing in your cart.'
end
