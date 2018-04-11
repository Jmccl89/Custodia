# frozen_string_literal: true

class EquipmentsController < ApplicationController
  before_action :logged_in_user, only: %i[create destroy]
  before_action :admin_user, only: :destroy

  def index
    @equipments = Equipment.paginate(page: params[:page])
  end

  def show
    @equipment = Equipment.find(params[:id])
    @entry = @equipment.entries.build if logged_in?
    @entries = @equipment.entries.paginate(page: params[:page], per_page: 6)
  end

  def create; end

  def destroy; end
end
