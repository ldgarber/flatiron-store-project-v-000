class LineItemsController < ApplicationController
  
  def create
    @user = current_user
    @user.current_cart = Cart.new if !current_cart
    @user.save

    @line_item = current_cart.add_item(params[:item_id])
    if @line_item.save
      redirect_to cart_path(current_cart)
    else
      flash[:message] = "Error in creating line item"
      redirect_to '/'
    end
  end

  private
  def current_cart
    current_user.current_cart
  end

end
