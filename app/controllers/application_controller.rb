# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

private

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = 'Please log in.'
      redirect_to login_url
    end
  end

  def admin_user
    unless current_user.admin?
      store_location
      flash[:danger] = 'You require admin privileges to perform that action.'
      redirect_to root_url
    end
  end
end
