class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  rescue_from Exception::NoMethodError, :with => :render_error

  private
  def logged_in_user
    unless logged_in?
      flash[:danger] = t "please_log_in"
      redirect_to login_url
    end
  end
  
  def render_error
    render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
  end
end
