# frozen_string_literal: true

class EquipmentController < ApplicationController
  require 'will_paginate/array'

  before_action :logged_in_user
  before_action :admin_user, only: %i[create destroy new edit]

  def index
    padding = 4
    @equipments = Equipment.all.sort_by do |e|
      e.name.gsub(/\d+/) \
          { |m| '0' * (4 - m.size) + m }
    end .paginate(page: params[:page])
  end

  def new
    @equipment = Equipment.new
  end

  def show
    @equipment = Equipment.find(params[:id])
    @entry = @equipment.entries.build if logged_in?
    @entries = @equipment.entries.paginate(page: params[:page], per_page: 6)
  end

  def create
    @equipment = Equipment.new(equipment_params)
    if @equipment.save
      flash[:success] = 'Equipment created!'
      redirect_to equipment_index_path fallback_location: root_url
    else
      render 'new'
    end
  end

  def edit
    @equipment = Equipment.find(params[:id])
  end

  def update
    @equipment = Equipment.find(params[:id])
    if @equipment.update(equipment_params)
      flash[:success] = 'Equipment updated.'
      redirect_to @equipment
    else
      render 'edit'
    end
  end

  def destroy
    Equipment.find(params[:id]).destroy
    flash[:success] = 'Equipment deleted.'
    redirect_to equipment_index_path
  end

private

  def equipment_params
    params.require(:equipment).permit(:name, :description, :purchase_date, :serial,
                                      :plate, :expiry_date, :primary_hours_label,
                                      :secondary_hours_label, :notes)
  end
end
