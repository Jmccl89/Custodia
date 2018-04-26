# frozen_string_literal: true

require 'test_helper'

class EquipmentPageTest < ActionDispatch::IntegrationTest
  include ApplicationHelper

  def setup
    @user = users(:john)
    @admin = users(:michael)
    @equipment = equipment(:ford)
    @entry = entries(:orange)
  end

  test 'equipment index' do
    log_in_as(@user)
    get equipment_index_path
    assert_template 'equipment/index'
    assert_select 'title', full_title('All Equipment')
  end

  test 'equipment display' do
    log_in_as(@user)
    get equipment_path(@equipment)
    assert_template 'equipment/show'
    assert_select 'title', full_title(@equipment.name)
    assert_match @equipment.entries.count.to_s, response.body
    assert_select 'ul.pagination'
  end

  test 'valid equipment creation' do
    log_in_as(@admin)
    get new_equipment_path
    assert_difference 'Equipment.count', 1 do
      post equipment_index_path, params: {
        equipment: { name: 'Unit 0',
                     description: 'Example Equipment',
                     serial: '1234567890',
                     purchase_date: '2018-12-25' }
      }
    end
  end

  test 'invalid equipment creation' do
    log_in_as(@admin)
    get new_equipment_path
    assert_no_difference 'Equipment.count' do
      post equipment_index_path, params: {
        equipment: { name: 'Invalid Name',
                     description: 'Example Equipment',
                     serial: '1234567890',
                     purchase_date: '2018-12-25' }
      }
    end
  end

  test 'equipment destroy' do
    log_in_as(@admin)
    assert_difference 'Equipment.count', -1 do
      delete equipment_path(@equipment)
    end
  end
end
