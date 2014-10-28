class CreateIntegrations < ActiveRecord::Migration
  def change
    create_table :integrations do |t|
      t.column :provider, :string
      t.column :details, :text
      t.column :user_id, :integer

      t.timestamps
    end
  end
end
