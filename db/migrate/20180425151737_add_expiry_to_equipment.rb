# frozen_string_literal: true

class AddExpiryToEquipment < ActiveRecord::Migration[5.2]
  def change
    add_column :equipment, :expiry_date, :date
  end
end
