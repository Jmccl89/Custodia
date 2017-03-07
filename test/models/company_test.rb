# frozen_string_literal: true
require 'test_helper'

class CompanyTest < ActiveSupport::TestCase
  def setup
    @company = Company.new(name: "Jim Bob's Trucking")
  end

  test 'should be valid' do
    assert @company.valid?
  end

  test 'name should be present' do
    @company.name = '   '
    assert_not @company.valid?
  end

  test 'name should not be too long' do
    @company.name = 'a' * 101
    assert_not @company.valid?
  end
end
