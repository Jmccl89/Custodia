# frozen_string_literal: true

class Entry < ApplicationRecord
  belongs_to :equipment
  default_scope -> { order(date: :desc) }
  validates :equipment_id, presence: true
  DATE_REGEX = /\A\d{4}-\d{2}-\d{2}\z/
  validates :date, presence: true, format: { with: DATE_REGEX }
  validates :content, presence: true, length: { maximum: 2000 }
  validates :mileage, presence: true,
                      numericality: { only_integer: true, greater_than: 0 }
  validates :employee, presence: true
end
