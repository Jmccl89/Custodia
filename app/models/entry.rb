# frozen_string_literal: true

class Entry < ApplicationRecord
  belongs_to :equipment
  default_scope -> { order(date: :desc) }
  mount_uploader :picture, PictureUploader
  validates :equipment_id, presence: true
  DATE_REGEX = /\A\d{4}-\d{2}-\d{2}\z/.freeze
  validates :date, presence: true, format: { with: DATE_REGEX }
  validates :content, presence: true, length: { maximum: 2000 }
  validates :mileage, presence: true,
                      numericality: { only_integer: true, greater_than: 0 },
                      allow_blank: true
  validates :primary_hours, numericality: { greater_than: 0 }, allow_blank: true
  validates :secondary_hours, numericality: { greater_than: 0 }, allow_blank: true
  validates :employee, presence: true
  validate :picture_size

private

  # Validates the size of an uploaded picture
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, 'should be less than 5MB')
    end
  end
end
