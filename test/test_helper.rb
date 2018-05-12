# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
require 'rails/test_help'
require 'simplecov'
SimpleCov.start do
  add_filter '/vendor/'
end
require 'minitest/reporters'
require 'faker'
Minitest::Reporters.use!

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def setup
    @base_title = 'Custodia'
    @user = users(:john)
    @other_user = users(:jane)
    @entry = entries(:orange)
  end

  # Returns true if test user is logged in
  def logged_in?
    !session[:user_id].nil?
  end

  # Log in as a user
  def log_in_as user
    session[:user_id] = user.id
  end
end

class ActionDispatch::IntegrationTest
  # Log in as a user
  def log_in_as user, password: 'password', remember_me: '1'
    post login_path, params: { session: { email: user.email,
                                          password: password,
                                          remember_me: remember_me } }
  end
end
