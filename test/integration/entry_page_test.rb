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
    assert_difference('Entry.count') do
      post equipment_entries_path(equipment_id: @equipment.id, entry: @entry.attributes)
    end
  end

  test 'invalid entry creation' do
    log_in_as(@user)
    assert_no_difference('Entry.count') do
      post equipment_entries_path(equipment_id: @equipment.id, entry: { date: '',
                                                                        content: '',
                                                                        mileage: 'a',
                                                                        employee: '' })
    end
  end

  test 'valid entry update' do
    log_in_as(@user)
    # TODO: test this
  end

  test 'invalid entry update' do
    log_in_as(@user)
    # TODO: test this
  end

  test 'entry destroy' do
    log_in_as(@user)
    # TODO: test this
  end
end
