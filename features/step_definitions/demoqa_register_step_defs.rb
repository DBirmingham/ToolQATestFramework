
# Given("I navigate to the register page") do
#     homepage.click_on_my_account_button
#     register.navigate_register_page
# end

# When("I submit a valid email and username") do
#   register.fill_in_username("Username9876")
#   register.fill_in_email("spartaglobaltest4@gmail.com")
#   register.click_register_button
# end

# Then("Receive the confirmation message") do
#   expect(register.register_confirmation_message).to eq 'Registration complete. Please check your email.'
# end


Given("I am on the email homepage") do
  # @gmail.gmail_homepage.visit_home_page
  gmail_homepage.visit_home_page
  sleep 4
end

Given("Successfully logged in") do
  gmail_homepage.fill_in_username("spartaglobaltest4@gmail.com")
  gmail_homepage.click_next_after_inputing_username
  gmail_homepage.fill_in_password('Password!123')
  gmail_homepage.click_next_after_inputing_password
end

When("I click the confirmation email") do
  # sleep 5
  gmail_homepage.click_on_more
  gmail_homepage.click_spam_email
  # gmail_homepage.fill_in_search_with_spam("in:spam")
  # gmail_homepage.click_search
  gmail_homepage.click_on_email
  sleep 5
end

Then("I navigate to the password creating page") do
  @gmail = gmail_homepage
  @gmail.click_on_confirmation_link
end

Given("I am on the password creating page") do
  @gmail.visit_password_set_page
  expect(register.check_register_link).to eq 'Enter your new password below.'
end

When("I submit the valid password") do
  gmail_homepage.fill_in_password('Password!23456')
  sleep 5
  register.click_reset_password
end

Then("My account should be successfully created") do
  expect(register.account_confirmation_message).to eq 'Your password has been reset. Log in'
end