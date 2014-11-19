class AddUnitPriceAndTotalPriceToShoppingListItems < ActiveRecord::Migration
  def change
    add_column :shopping_list_items, :unit_price, :float
    add_column :shopping_list_items, :total_price, :float
  end
end
