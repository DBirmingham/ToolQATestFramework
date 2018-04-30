require 'capybara/dsl'

class GmailHomepage
    include Capybara::DSL

    attr_accessor :url, :gmail_username_id, :gmail_password_id

    def initalize
        @url = "https://accounts.google.com/ServiceLogin/identifier?service=mail&passive=true&rm=false&continue=https%3A%2F%2Fmail.google.com%2Fmail%2F&ss=1&scc=1&ltmpl=default&ltmplcache=2&emr=1&osid=1&flowName=GlifWebSignIn&flowEntry=AddSession"
        @gmail_username_id = "identifierId"
        @gmail_password_id = "password"
    end

    def visit_home_page
        visit(@url)
    end

    def fill_in_username email
        fill_in(@gmail_username_id, :with => email )
    end 

    def click_next_after_inputing_username
        find(:css, 'div#identifierNext').click
    end

    def fill_in_password password
        fill_in(@gmail_password_id, :with => password)
    end

    def click_next_after_inputing_password
        find(:css, 'div#passwordNext').click
    end

    def click_on_more
        within(:id, ':3j') do
            find(:css, 'span.CJ').click
        end
    end

    def click_spam_email
        click_link('Spam')
    end

    def click_on_email
        within(:css, 'table.F') do
            find('tr').click
        end
    end

    def click_on_confirmation_link
        within(:css, 'div.a3s') do
            find('a').click
        end
    end
end
