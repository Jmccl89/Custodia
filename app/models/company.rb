# frozen_string_literal: true

class Company < ApplicationRecord
  has_many :equipments, dependent: :destroy
  validates :name, presence: true, length: { maximum: 100 }
end
