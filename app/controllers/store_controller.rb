class StoreController < ApplicationController
  #before_action :verify_logged_in, only: [:index]  

  def index
    @user = current_user
    @categories = Category.all
    @items = Item.available_items
  end

  private
  def verify_logged_in
    redirect_to user_session_path unless user_signed_in? 
  end
end
