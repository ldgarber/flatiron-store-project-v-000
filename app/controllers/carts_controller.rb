class CartsController < ApplicationController
  
  def show
    @current_cart = Cart.find(params[:id])
    #@current_cart = current_user.current_cart
  end

  def checkout
    @user = current_user
    @user.current_cart.reduce_inventories
    @current_cart = nil
    redirect_to store_path
  end

end
