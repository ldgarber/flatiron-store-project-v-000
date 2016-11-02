class CartsController < ApplicationController
  
  def show
    @current_cart = Cart.find(params[:id])
    @user = current_user
  end

  def checkout
    @cart = Cart.find(params[:id])
    @cart.reduce_inventories
    current_user.current_cart = nil
    if current_user.save
      redirect_to cart_path(@cart) 
    else
      flash[:error] = "couldn't check out" 
      redirect_to "/"
    end
  end

end
