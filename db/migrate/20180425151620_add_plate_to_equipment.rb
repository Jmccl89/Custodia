# frozen_string_literal: true

class AddPlateToEquipment < ActiveRecord::Migration[5.2]
  def change
    add_column :equipment, :plate, :string
  end
end
