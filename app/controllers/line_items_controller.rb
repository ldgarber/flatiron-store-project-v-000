class LineItemsController < ApplicationController
  
  def create
    #add line item to cart
    @item = Item.find(params[:item_id])
    @user = current_user
    if @user.current_cart == nil
      @cart = @user.carts.create
      @user.current_cart = @cart
    end
    @current_cart = @user.current_cart
    @line_item = @current_cart.add_item(@item.id)
    @line_item.increase_quantity
    @line_item.save
    redirect_to cart_path(@current_cart)
  end

end
