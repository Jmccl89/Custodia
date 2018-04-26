# frozen_string_literal: true

require 'test_helper'

class EntriesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @entry = entries(:orange)
    @equipment = equipment(:ford)
  end

  test 'should redirect create when not logged in' do
    assert_no_difference 'Entry.count' do
      post equipment_entries_path(1), params: { entry: { date: '2014-03-30',
                                                         content: 'Back brakes replaced, oil changed.',
                                                         mileage: 197_200,
                                                         employee: 'Gregg',
                                                         equipment: :ford } }
    end
    assert_redirected_to login_url
  end

  test 'should redirect destroy when not logged in' do
    assert_no_difference 'Entry.count' do
      delete equipment_entry_path(@equipment, @entry)
    end
    assert_redirected_to login_url
  end
end
