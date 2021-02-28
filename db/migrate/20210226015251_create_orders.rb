class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :product_id, :null => false
      t.integer :inventory_id, :null => false
      t.string :street_address, :null => false
      t.string :apartment, :null => false
      t.string :city, :null => false
      t.string :state, :null => false
      t.string :country_code, :null => false
      t.string :zip, :null => false
      t.string :phone_number, :null => false
      t.string :email, :null => false
      t.string :name, :null => false
      t.string :order_status, :null => false
      t.string :payment_ref, :null => false
      t.string :transaction_id, :null => false
      t.integer :payment_amt_cents, :null => false
      t.integer :ship_charged_cents, :null => false
      t.integer :ship_cost_cents, :null => false
      t.integer :subtotal_cents, :null => false
      t.integer :total_cents, :null => false
      t.string :shipper_name, :null => false
      t.timestamp :payment_date, :null => false
      t.timestamp :shipped_date, :null => false
      t.string :tracking_number, :null => false
      t.integer :tax_total_cents, :null => false

      t.timestamps
    end
  end
end
