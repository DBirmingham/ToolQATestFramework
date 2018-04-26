require 'capybara/dsl'

class DemoQaCategory
    include Capybara::DSL

    ADD_BUTTON = 'Add To Cart'
    FIRST_ITEM_ON_CATEGORY_LIST = 'Accessories'

    def click_add_button
        # find(:xpath,"//*[text()='#{Buy}']").click
        click_button(ADD_BUTTON)
    end

    def find_checkout_number        
        within(:id, "header_cart") do
            find(:css, "em").text.to_i
        end
    end

    def find_category_name_and_product_name 
        within(:css, "h2.prodtitle") do
            find(:css, "a").text
        end
    end

end