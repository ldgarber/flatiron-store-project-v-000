class Item < ActiveRecord::Base
  belongs_to :category
  has_many :line_items
def self.available_items
    where("inventory > ?", 0).to_a
  end

  def reduce_inventory_by(amount)
    self.inventory = self.inventory - amount 
    self.save
  end
end
