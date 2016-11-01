class LineItemsController < ApplicationController
  
  def create
    #add line item to cart
    @item = Item.find(params[:item_id])
    if current_user.current_cart == nil
      @cart = current_user.carts.create
      current_user.current_cart = @cart
      current_user.save
    end
    @current_cart = current_user.current_cart
    @line_item = @current_cart.add_item(@item.id)
    @line_item.save
    redirect_to cart_path(@current_cart)
  end

end
