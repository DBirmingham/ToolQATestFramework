require 'capybara/dsl'

class DemoQaCategory
    include Capybara::DSL

    ADD_BUTTON = 'Add To Cart'
    FIRST_ITEM_ON_CATEGORY_LIST = 'Accessories'
    BLOG_PRODUCT_ID = 'single_product_page_container'

    def click_add_button(index_of_item)
        page.all(:css, "input[name$=Buy]")[index_of_item].click
    end
    
    def check_url
		URI.parse(current_url)
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

    def view_product_category_from_blog_post
        find_by_id(BLOG_PRODUCT_ID)
    end

end