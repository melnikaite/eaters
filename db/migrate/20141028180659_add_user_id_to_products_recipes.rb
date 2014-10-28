class AddUserIdToProductsRecipes < ActiveRecord::Migration
  def change
    add_column :products_recipes, :user_id, :integer
  end
end
