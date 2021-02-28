class CreateInventories < ActiveRecord::Migration[6.1]
  def change
    create_table :inventories do |t|
      t.integer :product_id, :null => false
      t.integer :quantity
      t.string :color
      t.string :size
      t.decimal :weight
      t.integer :price_cents
      t.integer :sale_price_cents
      t.integer :cost_cents
      t.string :sku, :null => false
      t.decimal :length
      t.decimal :width
      t.decimal :height
      t.string :note

      t.timestamps
    end
  end
end
