# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :current_user
  private
  def current_user
    @current_user=User.where(id: session[:user_id]).first
  end



  def require_login
    unless @current_user
      flash[:danger]="Необходима авторизация"
      redirect_to login_path
    end
  end
end
