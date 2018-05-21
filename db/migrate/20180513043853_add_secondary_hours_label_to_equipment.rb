class AddSecondaryHoursLabelToEquipment < ActiveRecord::Migration[5.2]
  def change
    add_column :equipment, :secondary_hours_label, :string
  end
end
