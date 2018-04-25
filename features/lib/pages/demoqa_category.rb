require 'capybara/dsl'

class DemoQaCategory
    include Capybara::DSL

    ADD_BUTTON = 'Add To Cart'

    def click_add_button
        # find(:xpath,"//*[text()='#{Buy}']").click
        click_button(ADD_BUTTON)
    end

end