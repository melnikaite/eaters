class CreateShoppingLists < ActiveRecord::Migration
  def change
    create_table :shopping_lists do |t|
      t.column :title, :string
      t.column :integration_details, :text
      t.column :user_id, :integer

      t.timestamps
    end
  end
end
