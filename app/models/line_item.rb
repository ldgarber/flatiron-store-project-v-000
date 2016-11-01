class LineItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :item

  def increase_quantity
    @new_quantity = quantity + 1
    update_attributes(:quantity => @new_quantity)
  end
end
