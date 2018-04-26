require 'capybara/dsl'

class DemoQaCategory
    include Capybara::DSL

    ADD_BUTTON = 'Add To Cart'

    def click_add_button(index_of_item)
        # find(:xpath,"//*[text()='#{Buy}']").click
        # click_button(ADD_BUTTON)
        page.all(:css, "input[name$=Buy]")[index_of_item].click
    end
end