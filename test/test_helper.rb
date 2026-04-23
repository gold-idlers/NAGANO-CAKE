ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    # Add more helper methods to be used by all tests here...
  end
end

module CustomerSignInHelper
  def sign_in_as_customer(customer)
    post session_url, params: { email_address: customer.email_address, password: "password" }
  end
end

module AdminSignInHelper
  def sign_in_as_admin(admin)
    post admin_session_url, params: { email_address: admin.email_address, password: "password" }
  end
end
