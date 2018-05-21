class AddPrimaryHoursToEntry < ActiveRecord::Migration[5.2]
  def change
    add_column :entries, :primary_hours, :float
  end
end
