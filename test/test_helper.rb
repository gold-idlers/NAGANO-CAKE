ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

module ActiveSupport
  class TestCase
    parallelize(workers: :number_of_processors)
    fixtures :all
  end
end

module ActionDispatch
  class IntegrationTest
    def sign_in_as_customer(customer)
      post session_path, params: {
        email_address: customer.email_address,
        password: "password"
      }
    end

    def sign_in_as_admin(admin)
      post admin_session_path, params: {
        email_address: admin.email_address,
        password: "password"
      }
    end
  end
end