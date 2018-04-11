# frozen_string_literal: true

class EntriesController < ApplicationController
  before_action :logged_in_user, only: %i[create destroy]

  def create
    @equipment = params[:equipment]
    @entry = Equipment.find_by(id: params[:equipment]).entries.build(entry_params)
    if @entry.save
      flash[:success] = 'Micropost created!'
      redirect_back fallback_location: root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy; end

private

  def entry_params
    params.require(:entry).permit(:content, :mileage, :employee, :date, :equipment)
  end
end
