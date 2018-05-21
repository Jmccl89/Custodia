# frozen_string_literal: true

class Equipment < ApplicationRecord
  has_many :entries, dependent: :destroy
  default_scope -> { order(name: :asc) }
  NAME_REGEX = /\A(Unit)\s\w+\z/
  validates :name, presence: true, length: { maximum: 50 }, format: { with: NAME_REGEX }
  validates :description, presence: true, length: { maximum: 255 }
  validates :serial, presence: true, length: { maximum: 255 }, uniqueness: { case_sensitive: false }
  DATE_REGEX = /\A\d{4}-\d{2}-\d{2}\z/
  validates :purchase_date, presence: true, format: { with: DATE_REGEX }
  validates :plate, length: { maximum: 32 }
  validates :expiry_date, format: { with: DATE_REGEX, allow_blank: true }
  validates :primary_hours_label, allow_blank: true, length: { maximum: 32 }
  validates :secondary_hours_label, allow_blank: true, length: { maximum: 32 }
  NULL_ATTRS = %w[plate].freeze
  before_save :nil_if_blank

  def self.accessible_attributes
    %w[name description serial purchase_date plate expiry_date]
  end

protected

  def nil_if_blank
    NULL_ATTRS.each do |attr|
      if self[attr].blank?
        self[:expiry_date] = nil
        self[attr] = nil
      end
    end
  end
end
