# frozen_string_literal: true

class CreateEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :entries do |t|
      t.date :date
      t.text :content
      t.integer :mileage
      t.string :employee
      t.references :equipment, foreign_key: true

      t.timestamps
    end
  end
end
