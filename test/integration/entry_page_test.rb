# frozen_string_literal: true

require 'test_helper'

class EntryPageTest < ActionDispatch::IntegrationTest
  include ApplicationHelper

  def setup
    @user = users(:john)
    @equipment = equipment(:ford)
    @entry = entries(:orange)
  end

  test 'valid entry creation' do
    log_in_as(@user)
  end

  test 'invalid entry creation' do
    log_in_as(@user)
  end

  test 'valid entry update' do
    log_in_as(@user)
  end

  test 'invalid entry update' do
    log_in_as(@user)
  end

  test 'entry destroy' do
    log_in_as(@user)
  end
end
