# frozen_string_literal: true
class RenameEmployeeToUser < ActiveRecord::Migration[5.0]
  def change
    rename_table :employees, :users
  end
end
