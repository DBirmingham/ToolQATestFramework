# DemoQA E-Commerce Website

A project involving testing an ecommerce site using Behaviour-Driven development (BDD). We have
used an agile team methodology to track progress, assign roles and distribute the work evenly.

The UI Tests were created and automated according to the requirements given by the stakeholder.  
User Stories and features were managed using Trello.

The automation testing framework was built using Cucumber based on the selenium webdriver with Capybara.

## Contents

## Quickstart

### Install

Clone this repo to your personal computer and ensure you have the necessary gems installed within your root folder. In your terminal enter

```
gem install selenium-webdriver
gem install capybara
gem install cucumber
```

## Tests

### Examples

## Project Requirements

Test coverage of the following:

* Registration
* Signing in
* Lost Password
* Checkout and Basket
* Blog
* Product Category
	- Accessories
	- iMacs
	- iPads
	- iPhones
	- iPods
	- MacBooks
* Adding to cart
* Search
* Product Pages 
	- Grid
	- List
	- FaceBook likes

## Sprints 

### Sprint 1 - 12.00 pm 24 April 2018 - 3.00 pm 26 April 2018
Tests written for the highest priority user journey: purchase an item.
This included 8 user stories:

**(1)** As a User, I want to be able to successfully purchase the items in my basket.
```Cucumber
Given I am on the checkout page.
And I input the correct details.
When I submit the form.
Then I should receive the confirmation.
```
**(2)** As a User, I want to be able to select a product category so that I can view the items in that category.
```Cucumber
Given I select a product category.
When I click on a category.
Then I should get a list of items that match the category. 
```
**(3)** As a User, I want to be able to view the items in my basket.
```Cucumber
Given I am on the Demo QA home page.
And I have items in my basket.
When I select the basket page.
Then I receive a list of items in the basket.
```
**(4)** As a User, I want to get the correct error message when the basket is empty.
```Cucumber
Given I am on the home page.
And There are no items in my basket.
When I click on the checkout.
Then  I should get the correct error message.
```
**(5)** As a User, I want to be able to view a blog post.
```Cucumber
Given I am on the home page. 
When I click on a blog post.
Then I should view the correct blog post.
```
**(6)** As a User, I want to get the correct error message when I enter the wrong details in the checkout form.
```Cucumber
Given I am on the checkout page.
And I input no details.
When I submit the form.
And I got back to the checkout form. 
Then I should receive the correct error message.
```
**(7)** As a User, I want to be able to add items to my basket.
```Cucumber
Given I on the product category page. 
When When I click on Add item.
Then I should see the item count in the basket increment. 
```
**(8)** As a User, I want to be able to show/update/remove items in my basket.
```Cucumber
Given I visit the homepage
And I have at least one item in my basket
When When I click on the product name on the checkout page
Then The blog page is displayed
```
```Cucumber
Given I am on the checkout page
And I have at least one item in my basket
When When I input a new quantity and I click on the update
Then the total price should be update
```
```Cucumber
Given I am on the checkout page
And I have  more than one item in my basket
When When I click remove
Then The item should be removed from the basket
```
```Cucumber
Given I am on the checkout page
And I have only one item in my basket
When When I click remove
Then I receive the correct error
```

## Using Cucumber
Write feature files using GWT Gherkin syntax. A guide to this can be found here.

Navigate to the root of the project and run the cucumber command. This will read through all of the feature files and print out template step definitions. You can then use the POM to access and manipulate elements on the page.

