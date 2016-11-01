class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items

  def total
    sum = 0
    items.collect {|item| item.price}.reduce(:+)
  end

  def add_item(item_id)
    @item = Item.find(item_id)
    if self.items.include? @item 
      @line_item = self.line_items.find_by(:item_id => @item.id)
      return @line_item
    else
      return self.line_items.build(:item => @item, :quantity => 1) 
    end
  end

  def empty? 
    self.items.empty? 
  end

  def reduce_inventories
    items.each do |item|
      item.reduce_inventory_by_one
    end
  end
end
