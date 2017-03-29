# frozen_string_literal: true

class CreateEquipment < ActiveRecord::Migration[5.0]
  def change
    create_table :equipment do |t|
      t.string :name
      t.string :description
      t.string :serial
      t.date :purchase_date
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
