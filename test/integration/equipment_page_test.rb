# frozen_string_literal: true

require 'test_helper'

class EquipmentPageTest < ActionDispatch::IntegrationTest
  include ApplicationHelper

  def setup
    @user = users(:john)
    @equipment = equipment(:ford)
    @entry = entries(:orange)
  end

  test 'equipment display' do
    log_in_as(@user)
    get equipment_path(@equipment)
    assert_template 'equipments/show'
    assert_select 'title', full_title(@equipment.name)
    assert_match @equipment.entries.count.to_s, response.body
    assert_select 'ul.pagination'
  end
end
