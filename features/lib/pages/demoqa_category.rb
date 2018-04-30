require 'capybara/dsl'

class DemoQaCategory
    include Capybara::DSL

    ADD_BUTTON = 'Add To Cart'
    FIRST_ITEM_ON_CATEGORY_LIST = 'Accessories'
    BLOG_PRODUCT_ID = 'single_product_page_container'
    LIST_VIEW = 'default_products_page_container'
    GRID_VIEW = 'grid_view_products_page_container'
    GRID_BUTTON = 'Grid View'
    LIST_BUTTON = 'Default View'

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

    def view_grid_view
      find_by_id(GRID_VIEW)
    end

    def view_list_view
      find_by_id(LIST_VIEW)
    end

    def grid_view
      click_on(GRID_BUTTON)
    end

    def list_view
      click_on(LIST_BUTTON)
    end

    def check_view_title
      within(:css, "header.page-header") do
        find(:css, "h1").text
      end
    end

    def check_item_in_list
      within(:css, "div#default_products_page_container") do
        find(:css, "div.default_product_display").native.css_value('width')
      end
    end

    def check_item_in_grid
      within(:css, "div#grid_view_products_page_container") do
        within(:css, "div.product_grid_display") do
          find(:css, "div").native.css_value('width')
        end
      end
    end
end
