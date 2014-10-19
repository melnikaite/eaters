class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.float :rest
      t.float :required
      t.integer :unit_id
      t.integer :category_id

      t.timestamps
    end
  end
end
