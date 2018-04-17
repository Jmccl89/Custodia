# frozen_string_literal: true

class EquipmentImportsController < ApplicationController
  def new
    @equipment_import = EquipmentImport.new
  end

  def create
    @equipment_import = EquipmentImport.new(params[:equipment_import])
    if @equipment_import.save
      redirect_to root_url, notice: 'Imported equipment successfully.'
    else
      render :new
    end
  end
end
