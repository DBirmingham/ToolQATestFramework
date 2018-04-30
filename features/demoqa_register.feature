Feature: Register

    @test_reg_account
    Scenario: If I submit a valid email and correctly follow the sequential steps then I should be successfully registered

        Given I visit the DemoQA homepage
        And I navigate to the register page
        When I submit a valid email and username
        Then I receive the confirmation message

        Given I am on the email homepage
        And I successfully logged in
        When I click the confirmation email
        Then I navigate to the password creating page

        Given I am on the password creating page
        When I submit the valid password
        Then I should have successfully created an account
