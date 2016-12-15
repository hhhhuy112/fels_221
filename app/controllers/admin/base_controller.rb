class Admin::BaseController < ApplicationController
  before_action :logged_in_user
  before_action :check_admin_permission

  def check_admin_permission
    unless current_user.admin?
      flash[:danger] = t "admin_alert_permission"
      redirect_to root_url
    end
  end
end
