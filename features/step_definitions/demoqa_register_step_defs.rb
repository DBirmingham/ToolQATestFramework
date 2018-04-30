Given("I navigate to the register page") do
    demo_homepage.click_on_my_account_button
    demo_register.navigate_register_page
end

When("I submit a valid email and username") do
    demo_register.fill_in_username("Useasasdadawejk1231")
    demo_register.fill_in_email("asdhbasasdsadsa12@gmail.com")
    demo_register.click_register_button
end

Then("I receive the confirmation message") do
    expect(demo_register.register_confirmation_message).to eq 'Registration complete. Please check your email.'
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
    sleep 4
end

Given("I successfully logged in") do
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

Then("I should have successfully created an account") do
    pending # Write code here that turns the phrase above into concrete actions
end
