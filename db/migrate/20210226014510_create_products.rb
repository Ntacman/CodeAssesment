class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :product_name, :null => false
      t.string :description
      t.string :style, :null => false
      t.string :brand, :null => false
      t.string :url
      t.string :product_type
      t.integer :shipping_price, :null => false
      t.string :note
      t.integer :admin_id, :null => false

      t.timestamps
    end
  end
end
