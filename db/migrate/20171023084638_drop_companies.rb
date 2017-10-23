# frozen_string_literal: true

class DropCompanies < ActiveRecord::Migration[5.1]
  def change
    drop_table :companies
  end
end
