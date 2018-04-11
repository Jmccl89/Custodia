# frozen_string_literal: true

require 'test_helper'

class EntriesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @entry = entries(:orange)
  end

  test 'should redirect create when not logged in' do
    assert_no_difference 'Entry.count' do
      post entries_path, params: { entry: { date: '2014-03-30',
                                            content: 'Back brakes replaced, oil changed.',
                                            mileage: 197_200,
                                            employee: 'Gregg',
                                            equipment: :ford } }
    end
    assert_redirected_to login_url
  end

  test 'should redirect destroy when not logged in' do
    assert_no_difference 'Entry.count' do
      delete entry_path(@entry)
    end
    assert_redirected_to login_url
  end
end
