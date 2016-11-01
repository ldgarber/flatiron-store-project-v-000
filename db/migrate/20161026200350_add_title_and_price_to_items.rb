class AddTitleAndPriceToItems < ActiveRecord::Migration
  def change
    add_column :items, :title, :string
    add_column :items, :price, :decimal
  end
end
