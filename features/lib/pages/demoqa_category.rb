require 'capybara/dsl'

class DemoQaCategory
    include Capybara::DSL

    ADD_BUTTON = 'Add To Cart'
    BLOG_PRODUCT_ID = 'single_product_page_container'

    def click_add_button
        # find(:xpath,"//*[text()='#{Buy}']").click
        click_button(ADD_BUTTON)
    end

    def view_product_category_from_blog_post
        find_by_id(BLOG_PRODUCT_ID)
    end

end