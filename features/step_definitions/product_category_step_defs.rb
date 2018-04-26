Given("I am on the home page.") do
  homepage.visit_homepage
end

When("I click on a blog post.") do
  homepage.click_blog_post
end

Then("I should view the correct blog post.") do
  category.view_product_category_from_blog_post
end
