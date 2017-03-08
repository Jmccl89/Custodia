# frozen_string_literal: true
class Equipment < ApplicationRecord
  belongs_to :company
  has_many :entrys
  validates :name, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 255 }
  validates :serial, presence: true, length: { maximum: 255 }, uniqueness: { case_sensitive: false }
  DATE_REGEX = /\d{4}-\d{2}-\d{2}/
  validates :purchase_date, presence: true, format: { with: DATE_REGEX }
end
