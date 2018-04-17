# frozen_string_literal: true

class AddPictureToEntries < ActiveRecord::Migration[5.2]
  def change
    add_column :entries, :picture, :string
  end
end
