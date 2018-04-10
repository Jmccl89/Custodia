# frozen_string_literal: true

class Equipment < ApplicationRecord
  has_many :entrys, dependent: :destroy
  validates :name, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 255 }
  validates :serial, presence: true, length: { maximum: 255 }, uniqueness: { case_sensitive: false }
  DATE_REGEX = /\A\d{4}-\d{2}-\d{2}\z/
  validates :purchase_date, presence: true, format: { with: DATE_REGEX }
end
