require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  #include the application helper so that those helper methods are available in our tests via this text helper file
  include ApplicationHelper

  # Add more helper methods to be used by all tests here...
end
