# frozen_string_literal: true

class EquipmentImport
  # switch to ActiveModel::Model in Rails 4
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :file

  def initialize attributes = {}
    attributes.each { |name, value| send("#{name}=", value) }
  end

  def persisted?
    false
  end

  def save
    if imported_equipment.map(&:valid?).all?
      imported_equipment.each(&:save!)
      true
    else
      imported_equipment.each_with_index do |equipment, index|
        equipment.errors.full_messages.each do |message|
          errors.add :base, "Row #{index + 2}: #{message}"
        end
      end
      false
    end
  end

  def imported_equipment
    @imported_equipment ||= load_imported_equipment
  end

  def load_imported_equipment
    spreadsheet = open_spreadsheet
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).map do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      equipment = Equipment.find_by(id: row['id']) || Equipment.new
      equipment.attributes = row.to_hash.slice(*Equipment.accessible_attributes)
      equipment
    end
  end

  def open_spreadsheet
    case File.extname(file.original_filename)
    when '.csv' then Roo::Spreadsheet.open(file.path)
    when '.xls' then Excel.new(file.path, nil, :ignore)
    when '.xlsx' then Excelx.new(file.path, nil, :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end
end
