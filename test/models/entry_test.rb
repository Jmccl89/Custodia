# frozen_string_literal: true
require 'test_helper'

class EntryTest < ActiveSupport::TestCase
  def setup
    @company = Company.new(name: "Bob's Trucking")
    @company.save
    @equipment = Equipment.new(company_id: @company.id, name: 'Unit 59', description: 'Chevrolet Silverado 2008',
                               serial: '1GCEK19098Z148759', purchase_date: '2012-10-25')
    @equipment.save
    @entry = Entry.new(equipment_id: @equipment.id, date: '2013-03-30', content: 'Back shocks replaced, oil changed.',
                       mileage: 197_000, employee: 'Thomas')
  end

  test 'should be valid' do
    assert @entry.valid?
  end

  test 'date should be present' do
    @entry.date = '   '
    assert_not @entry.valid?
  end

  test 'date should be valid' do
    @entry.date = '2022-333-2'
    assert_not @entry.valid?
  end

  test 'content should be present' do
    @entry.content = '    '
    assert_not @entry.valid?
  end

  test 'content should not be too long' do
    @entry.content = 'w' * 256
    assert_not @entry.valid?
  end

  test 'mileage should be present' do
    @entry.mileage = '   '
    assert_not @entry.valid?
  end

  test 'mileage should be valid' do
    @entry.mileage = -1
    assert_not @entry.valid?
    @entry.mileage = 'a'
    assert_not @entry.valid?
  end

  test 'employee should be present' do
    @entry.employee = '   '
    assert_not @entry.valid?
  end

  test 'employee should exist' do
    # TODO: Test this once linked to employee database
  end
end
