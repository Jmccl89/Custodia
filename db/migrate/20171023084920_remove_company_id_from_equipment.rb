# frozen_string_literal: true

class RemoveCompanyIdFromEquipment < ActiveRecord::Migration[5.1]
  def change
    remove_column :equipment, :company_id, :integer
  end
end
