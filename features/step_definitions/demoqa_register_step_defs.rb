
Given("I navigate to the register page") do
    homepage.click_on_my_account_button
    register.navigate_register_page
end

When("I submit a valid email and username") do
  register.fill_in_username("Useasasdadawejk1231")
  register.fill_in_email("asdhbasasdsadsa12@gmail.com")
  register.click_register_button
end

Then("Receive the confirmation message") do
  expect(register.register_confirmation_message).to eq 'Registration complete. Please check your email.'
end


Given("I am on the email homepage") do
  gmail_homepage.visit_home_page
  gmail_homepage.fill_in_username("spartaglobaltest2@gmail.com")
  gmail_homepage.click_next_after_inputing_username
  gmail_homepage.fill_in_password('Password!123')
  gmail_homepage.click_next_after_inputing_password
  gmail_homepage.click_on_more
  gmail_homepage.click_spam_email
  gmail_homepage.click_on_email
  gmail_homepage.click_on_confirmation_link
  wait_time(5)
end

Given("Successfully logged in") do
  pending # Write code here that turns the phrase above into concrete actions
end

When("I click the confirmation email") do
  pending # Write code here that turns the phrase above into concrete actions
end

Then("I navigate to the password creating page") do
  pending # Write code here that turns the phrase above into concrete actions
end

Given("I am on the password creating page") do
  pending # Write code here that turns the phrase above into concrete actions
end

When("I submit the valid password") do
  pending # Write code here that turns the phrase above into concrete actions
end

Then("My account should be successfully created") do
  pending # Write code here that turns the phrase above into concrete actions
end