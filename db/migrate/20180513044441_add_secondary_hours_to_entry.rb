class AddSecondaryHoursToEntry < ActiveRecord::Migration[5.2]
  def change
    add_column :entries, :secondary_hours, :float
  end
end
