# frozen_string_literal: true

class AddIndexToEntry < ActiveRecord::Migration[5.2]
  def change
    add_index :entries, %i[equipment_id date]
  end
end
