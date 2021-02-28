class AddColumnsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string, :null => false
    add_column :users, :superadmin, :boolean, :null => false
    add_column :users, :shop_name, :string, :null => false
    add_column :users, :remember_token, :string
    add_column :users, :card_brand, :string, :null => false
    add_column :users, :card_last_four, :string, :null => false
    add_column :users, :trial_ends_at, :string, :null => false
    add_column :users, :shop_domain, :string, :null => false
    add_column :users, :is_enabled, :boolean, :null => false
    add_column :users, :billing_plan, :string, :null => false
    add_column :users, :trial_starts_at, :timestamp, :null => false
  end
end
