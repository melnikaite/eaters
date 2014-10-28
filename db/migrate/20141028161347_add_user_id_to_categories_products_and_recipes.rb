class AddUserIdToCategoriesProductsAndRecipes < ActiveRecord::Migration
  def change
    add_column :categories, :user_id, :integer
    add_column :products, :user_id, :integer
    add_column :recipes, :user_id, :integer
  end
end
