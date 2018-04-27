Feature: Register
    @reg
    Scenario: If I submit a valid email and correctly follow the sequential steps then I should be successfully registered.

        Given I visit the homepage
        And I navigate to the register page
        When I submit a valid email and username
        Then Receive the confirmation message

        Given I am on the email homepage
        And Successfully logged in
        When I click the confirmation email
        Then I navigate to the password creating page

        Given I am on the password creating page
        When I submit the valid password
        Then My account should be successfully created