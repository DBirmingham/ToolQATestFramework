Given("I have an item in my basket") do
	homepage.hover_product_categories
	homepage.click_first_product_on_dropdown_menu
	category.click_add_button 0
	sleep 2
end

Given("I have more than one item in my basket") do
	homepage.hover_product_categories
	homepage.click_first_product_on_dropdown_menu
	category.click_add_button 0
	category.click_add_button 1
	sleep 2
end

Then("I receive a list of items in the basket") do
	expect(checkout.item_list.length).to be >= 1
end

When("I click on the product name on the checkout page") do
	@item_name = checkout.get_item_name 0
	checkout.select_product 0
end

Then("The blog page is displayed") do
	expect(checkout.check_url.path).to include @item_name
end

When("I input a new quantity") do
  	@checkout = checkout
  	@checkout.update_quantity 0, 3
  	@quantity = @checkout.quantity
end

When("I click on the update") do
  	checkout.save_update 0
end

Then("The total price should be update") do
  	total = checkout.get_total_price_of_item 0
  	price = checkout.get_price_of_item 0
  	quantity = total/price
  	expect(quantity).to eq @quantity
end


When("I click remove") do
	@list_length = checkout.item_list.length
	checkout.remove_item 0
end

Then("I should get the correct error message on the checkout page") do 
	expect(checkout.get_empty_basket_message).to eq 'Oops, there is nothing in your cart.'
end

Then("The item should be removed from the basket") do
	expect(checkout.item_list.length).to eq (@list_length - 1)
end