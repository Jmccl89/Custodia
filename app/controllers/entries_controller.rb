# frozen_string_literal: true

class EntriesController < ApplicationController
  before_action :logged_in_user
  before_action :admin_user, only: :destroy

  def create
    @equipment = Equipment.find(params[:equipment_id])
    @entry = @equipment.entries.build(entry_params)
    if @entry.save
      flash[:success] = 'Entry created!'
      redirect_back fallback_location: root_url
    else
      render 'static_pages/home'
    end
  end

  def edit
    @entry = Entry.find(params[:id])
    @equipment = Equipment.find(@entry.equipment_id)
  end

  def update
    @entry = Entry.find(params[:id])
    @equipment = Equipment.find(@entry.equipment_id)
    if @entry.update(entry_params)
      flash[:success] = 'Entry updated.'
      redirect_to @equipment
    else
      render 'edit'
    end
  end

  def destroy
    Entry.find(params[:id]).destroy
    flash[:success] = 'Entry removed'
    redirect_back fallback_location: root_url
  end

private

  def entry_params
    params.require(:entry).permit(:content, :mileage, :employee, :date, :equipment, :picture)
  end
end
