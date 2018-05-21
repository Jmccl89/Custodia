# frozen_string_literal: true

require 'test_helper'

class EntryTest < ActiveSupport::TestCase
  def setup
    @equipment = Equipment.new(name: 'Unit 59', description: 'Chevrolet Silverado 2008',
                               serial: '1GCEK19098Z148759', purchase_date: '2012-10-25')
    @equipment.save
    @entry = @equipment.entries.build(date: '2013-03-30', content: 'Back shocks replaced, oil changed.',
                                      mileage: 197_000, employee: 'Thomas')
  end

  test 'should be valid' do
    assert @entry.valid?
  end

  test 'equipment id should be present' do
    @entry.equipment_id = nil
    assert_not @entry.valid?
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
    @entry.content = 'w' * 2001
    assert_not @entry.valid?
  end

  test 'deprecated mileage should be valid if present' do
    @entry.mileage = -1
    assert_not @entry.valid?
    @entry.mileage = 'a'
    assert_not @entry.valid?
  end

  test 'primary hours should be valid if present' do
    @entry.primary_hours = 100.0
    assert @entry.valid?
    @entry.primary_hours = 'abc'
    assert_not @entry.valid?
    @entry.primary_hours = -1
    assert_not @entry.valid?
  end

  test 'secondary hours should be valid if present' do
    @entry.primary_hours = 100.0
    assert @entry.valid?
    @entry.primary_hours = 'abc'
    assert_not @entry.valid?
    @entry.primary_hours = -1
    assert_not @entry.valid?
  end

  test 'employee should be present' do
    @entry.employee = '   '
    assert_not @entry.valid?
  end

  test 'order should be newest first' do
    assert_equal entries(:red), Entry.first
  end

  test 'employee should exist' do
    # TODO: Test this once linked to employee database
  end
end
