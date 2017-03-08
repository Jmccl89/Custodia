# frozen_string_literal: true
class Entry < ApplicationRecord
  belongs_to :equipment
  DATE_REGEX = /\d{4}-\d{2}-\d{2}/
  validates :date, presence: true, format: { with: DATE_REGEX }
  validates :content, presence: true, length: { maximum: 255 }
  validates :mileage, presence: true,
                      numericality: { only_integer: true, greater_than: 0 }
  validates :employee, presence: true
end
