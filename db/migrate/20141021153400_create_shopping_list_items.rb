class CreateShoppingListItems < ActiveRecord::Migration
  def change
    create_table :shopping_list_items do |t|
      t.column :shopping_list_id, :integer
      t.column :product_id, :integer
      t.column :unit_id, :integer
      t.column :required, :integer
      t.column :done, :boolean, default: false

      t.timestamps
    end
  end
end
