# frozen_string_literal: true

class EquipmentController < ApplicationController
  before_action :logged_in_user, only: %i[create destroy]
  before_action :admin_user, only: :destroy

  def index
    @equipments = Equipment.paginate(page: params[:page])
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
      redirect_back fallback_location: root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy; end

private

  def equipment_params
    params.require(:equipment).permit(:name, :description, :purchase_date, :serial)
  end
end
