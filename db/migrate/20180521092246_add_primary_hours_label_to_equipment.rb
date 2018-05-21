class AddPrimaryHoursLabelToEquipment < ActiveRecord::Migration[5.2]
  def change
    add_column :equipment, :primary_hours_label, :string
  end
end
