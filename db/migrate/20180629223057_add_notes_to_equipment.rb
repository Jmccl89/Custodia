class AddNotesToEquipment < ActiveRecord::Migration[5.2]
  def change
    add_column :equipment, :notes, :text
  end
end
