require 'capybara/dsl'

class Checkout
  include Capybara::DSL

  ERROR_MESSAGE = 'Oops, there is nothing in your cart.'

  def check_checkout_error_message
    find('div', text: ERROR_MESSAGE)
  end

end
