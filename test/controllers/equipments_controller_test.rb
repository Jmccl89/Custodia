# frozen_string_literal: true

require 'test_helper'

class EquipmentsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @base_title = 'Custodia'
    @equipment = equipment(:ford)
    @user       = users(:michael)
    @other_user = users(:archer)
  end

  test 'should redirect create when not logged in' do
    assert_no_difference 'Equipment.count' do
      post equipment_index_path, params: { equipment: { name: 'Unit 123',
                                                        description: 'Ford Fiesta 2018',
                                                        serial: '1234FORD123',
                                                        purchase_date: '2018-10-25' } }
    end
    assert_redirected_to login_url
  end

  test 'only admins should get create' do
    log_in_as(@other_user)
    assert_no_difference 'Equipment.count' do
      post equipment_index_path, params: {
        equipment: { name: 'Unit 123',
                     description: 'Ford Fiesta 2018',
                     serial: '1234FORD123',
                     purchase_date: '2018-10-25' }
      }
    end
    assert_response :redirect
    log_in_as(@user)
    get new_equipment_path
    assert_response :success
    assert_select 'title', @base_title.to_s
  end

  test 'should redirect new when not logged in' do
    get new_equipment_path
    assert_response :redirect
  end

  test 'only admins should get new' do
    log_in_as(@other_user)
    get new_equipment_path
    assert_response :redirect
    log_in_as(@user)
    get new_equipment_path
    assert_response :success
    assert_select 'title', @base_title.to_s
  end

  test 'should redirect edit when not logged in' do
    get edit_equipment_path(@equipment)
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test 'only admins should get edit' do
    log_in_as(@other_user)
    get edit_equipment_path(@equipment)
    assert_response :redirect
    log_in_as(@user)
    get edit_equipment_path(@equipment)
    assert_response :success
    assert_select 'title', "Edit equipment | #{@base_title}"
  end

  test 'should redirect update when not logged in' do
    patch equipment_path(@equipment), params: { equipment: { name: 'Unit 123',
                                                             description: 'Ford Fiesta 2018',
                                                             serial: '1234FORD123',
                                                             purchase_date: '2018-10-25' } }
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test 'should redirect update when logged in as a non-admin' do
    log_in_as(@other_user)
    patch equipment_path(@equipment), params: { equipment: { name: 'Unit 123',
                                                             description: 'Ford Fiesta 2018',
                                                             serial: '1234FORD123',
                                                             purchase_date: '2018-10-25' } }
    assert_not flash.empty?
    assert_redirected_to equipment_path
  end

  test 'should redirect destroy when not logged in' do
    assert_no_difference 'Equipment.count' do
      delete equipment_path(@equipment)
    end
    assert_redirected_to login_url
  end

  test 'should redirect destroy when logged in as a non-admin' do
    log_in_as(@other_user)
    assert_no_difference 'Equipment.count' do
      delete equipment_path(@equipment)
    end
    assert_redirected_to root_url
  end
end
