class RenameProductssRecipesTable < ActiveRecord::Migration
  def change
    rename_table :productss_recipes, :products_recipes
  end
end
