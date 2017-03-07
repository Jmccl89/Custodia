# frozen_string_literal: true
class Equipment < ApplicationRecord
  belongs_to :company
  validates :name, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 255 }
  validates :serial, presence: true, length: { maximum: 255 }, uniqueness: { case_sensitive: false }
  validates :purchase_date, presence: true
end
