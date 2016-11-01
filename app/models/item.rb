class Item < ActiveRecord::Base
  belongs_to :category
  has_many :line_items

  def self.available_items
    where("inventory > ?", 0).to_a
  end

  def reduce_inventory_by_one
    inventory = inventory - 1
    self.save
  end
end
