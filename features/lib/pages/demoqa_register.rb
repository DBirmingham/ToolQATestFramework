require 'capybara/dsl'

class Register 
    include Capybara::DSL

    REGISTER_LINK = 'Register'
    USER_ID = 'user_login'
    EMAIL_ID = 'user_email'
    REGISTER_BUTTON = 'wp-submit'
    RESET_PASSWORD = 'pass1-text'
    RESET_CONFIRMATION = 'wp-submit'
    RESET_BUTTON = 'wp-submit'

    def navigate_register_page
        click_link(REGISTER_LINK)
    end

    def fill_in_username(username)
        fill_in(USER_ID, :with => username)
    end

    def fill_in_email(email)
        fill_in(EMAIL_ID, :with => email)
    end

    def click_register_button
        click_button(REGISTER_BUTTON)
    end

    def register_confirmation_message
        within(:id, 'login') do
            find(:css, 'p.message').text
        end
    end

    def fill_in_password(new_password)
        fill_in(RESET_PASSWORD, :with => new_password)
    end

    def click_reset_password
        click_button(RESET_CONFIRMATION)
    end

    def account_confirmation_message
        within(:id, 'login') do
            find(:css, 'p.reset-pass').text
        end
    end

    def check_register_link
        within(:css, 'body.login') do 
            within(:css, 'div#login') do
                find(:css, 'p.message').text
            end
        end
    end


end