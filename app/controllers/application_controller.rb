class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_cart 

  private 
  def current_cart
    current_user.current_cart
  end

  def after_sign_out_path
    root_path
  end
  
end
