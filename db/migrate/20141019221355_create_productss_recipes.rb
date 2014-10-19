class CreateProductssRecipes < ActiveRecord::Migration
  def change
    create_table :productss_recipes do |t|
      t.integer :product_id
      t.integer :recipe_id
      t.float :required
      t.integer :unit_id

      t.timestamps
    end
  end
end
