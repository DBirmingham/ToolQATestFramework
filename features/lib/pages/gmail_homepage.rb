require 'capybara/dsl'

class GmailHomepage
    include Capybara::DSL 

    URL = "https://accounts.google.com/ServiceLogin/identifier?service=mail&passive=true&rm=false&continue=https%3A%2F%2Fmail.google.com%2Fmail%2F&ss=1&scc=1&ltmpl=default&ltmplcache=2&emr=1&osid=1&flowName=GlifWebSignIn&flowEntry=AddSession"
    GMAIL_USERNAME = "identifierId"
    GMAIL_PASSWORD = "password"
    NEXT_BUTTON_ID = "identifierNext"
    URL_SPAM = 'https://mail.google.com/mail/u/0/#spam'
    SEARCH_ID = 'gbqfq'

    def visit_home_page
        visit(URL)
    end

    def fill_in_username email
        fill_in(GMAIL_USERNAME, :with => email )
    end 

    def click_next_after_inputing_username
        find(:css, 'div#identifierNext').click
    end

    def fill_in_password password
        fill_in(GMAIL_PASSWORD, :with => password)
    end

    def click_next_after_inputing_password
        find(:css, 'div#passwordNext').click
    end

    def click_on_more
        # within(:id, ':3j') do
            find(:css, 'span.CJ').click
        # end
    end

    # def go_to_spam(path)
    #     visit()
    # end

    def fill_in_search_with_spam(spam_text)
        fill_in(SEARCH_ID, :with => spam_text )
    end

    def click_search
        find(:id, "gbqfb").click
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
            @confirmation_link = find('a').text
        end
    end

    def visit_password_set_page
        visit(@confirmation_link)
    end




end