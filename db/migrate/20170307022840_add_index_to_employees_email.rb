# frozen_string_literal: true
class AddIndexToEmployeesEmail < ActiveRecord::Migration[5.0]
  def change
    add_index :employees, :email, unique: true
  end
end
