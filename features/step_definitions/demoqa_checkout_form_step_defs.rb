Then ("I should get the correct error message") do
    expect(demo_checkout.check_checkout_error_message).to eq 'Oops, there is nothing in your cart.'
end

Given("I add an item to cart") do
    demo_homepage.hover_product_categories
    demo_homepage.select_category_by_name("iPhones")
    demo_category.click_add_button(0)
    wait_time(5)
end

When("I submit the checkout form") do
    demo_homepage.visit_checkout_cart
    demo_checkout.click_checkout_your_cart_continue_button
    demo_checkout.click_checkout_info_purchase_button
end

When("I got back to the checkout form") do
    demo_checkout.click_checkout_your_cart_continue_button
end

Then("I should receive the correct error message") do
    expect(demo_checkout.check_form_error_message).to eq demo_checkout.checkout_error_list
end

Given("I am on the checkout page") do
    demo_homepage.visit_homepage
    demo_homepage.hover_product_categories
    demo_homepage.select_category_by_name("iPhones")
    demo_category.click_add_button(0)
    demo_homepage.visit_checkout_cart
    demo_checkout.click_checkout_your_cart_continue_button
end

Given("I input the correct details") do
    demo_checkout.fill_in_first_name('jose')
    demo_checkout.fill_in_last_name('david')
    demo_checkout.fill_in_address('32 opulta')
    demo_checkout.fill_in_email('joe@sparta.com')
    demo_checkout.fill_in_city('london')
    demo_checkout.fill_in_country('option[2]')
    demo_checkout.fill_in_post_code('en5 23h')
    demo_checkout.fill_in_county('hereford')
    demo_checkout.fill_in_phone('07942424525')
    demo_checkout.fill_in_shipphing
end

When("I submit the form") do
    demo_checkout.click_checkout_info_purchase_button
end

Then("I should receive the confirmation.") do
  expect(checkout.checkout_confirmation).to eq 'Thank you, your purchase is pending. You will be sent an email once the order clears.'
end
