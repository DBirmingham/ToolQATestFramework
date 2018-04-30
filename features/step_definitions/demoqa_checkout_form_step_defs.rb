Given("I am on the demo home page") do
  homepage.visit_homepage
end

And("I add an item to cart") do
  homepage.hover_product_categories
  homepage.select_category_by_name("iPhones")
  category.click_add_button(0)
  wait_time(5)
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

Given("I am on the checkout page.") do
  homepage.visit_homepage
  homepage.hover_product_categories
  homepage.select_category_by_name("iPhones")
  category.click_add_button(0)
  homepage.visit_checkout_cart
  checkout.click_checkout_your_cart_continue_button
end

And("I input the correct details.") do
  checkout.fill_in_first_name('jose')
  checkout.fill_in_last_name('david')
  checkout.fill_in_address('32 opulta')
  checkout.fill_in_email('joe@sparta.com')
  checkout.fill_in_city('london')
  checkout.fill_in_country('option[2]')
  checkout.fill_in_post_code('en5 23h')
  checkout.fill_in_county('hereford')
  checkout.fill_in_phone('07942424525')
  checkout.fill_in_shipphing
end

When("I submit the form.") do
  checkout.click_checkout_info_purchase_button
end

Then("I should receive the confirmation.") do
  expect(checkout.checkout_confirmation).to eq 'Thank you, your purchase is pending. You will be sent an email once the order clears.' 
end
