require 'csv'

desc "Imports seed data from CSVs"

task :import_data do
  CSV.foreach('./data/inventory.csv', :headers => true) do |row|
    # "id","product_id","quantity","color","size","weight","price_cents","sale_price_cents","cost_cents","sku","length","width","height","note"
    Inventory.create(
      :product_id => row['product_id'],
      :quantity => row['quantity'],
      :color => row['color'],
      :size => row['size'],
      :weight => row['weight'],
      :price_cents => row['price_cents'],
      :sale_price_cents => row['sale_price_cents'],
      :cost_cents => row['cost_cents'],
      :sku => row['sku'],
      :length => row['length'],
      :width => row['width'],
      :height => row['height'],
      :note => row['note']
    )
  end

  CSV.foreach('./data/products.csv', :headers => true) do |row|
    # "id","product_name","description","style","brand","created_at","updated_at","url","product_type","shipping_price","note","admin_id"
    Product.create(
      :product_name => row['product_name'],
      :description => row['description'],
      :style => row['style'],
      :brand => row['brand'],
      :url => row['url'],
      :product_type => row['product_type'],
      :shipping_price => row['shipping_price'],
      :note => row['note'],
      :admin_id => row['admin_id']
    )
  end

  CSV.foreach('./data/orders.csv', :headers => true) do |row|
    Order.create(
      :product_id => row['product_id'],
      :street_address => row['street_address'],
      :apartment => row['apartment'],
      :city => row['city'],
      :state => row['state'],
      :country_code => row['country_code'],
      :zip => row['zip'],
      :phone_number => row['phone_number'],
      :email => row['email'],
      :name => row['name'],
      :order_status => row['order_status'],
      :payment_ref => row['payment_ref'],
      :transaction_id => row['transaction_id'],
      :payment_amt_cents => row['transaction_id'],
      :ship_charged_cents => row['ship_charged_cents'],
      :ship_cost_cents => row['ship_cost_cents'],
      :subtotal_cents => row['subtotal_cents'],
      :total_cents => row['total_cents'],
      :shipper_name => row['shipper_name'],
      :payment_date => row['payment_date'],
      :shipped_date => row['shipped_date'],
      :tracking_number => row['tracking_number'],
      :tax_total_cents => row['tax_total_cents']
    )
  end

  CSV.foreach('./data/users.csv', :headers => true) do |row|
    # "id","name","email","password_hash","password_plain","superadmin","shop_name","remember_token","card_brand","card_last_four","trial_ends_at","shop_domain","is_enabled","billing_plan","trial_starts_at"
    user = User.new 
    user.id = row['id']
    user.name = row['name']
    user.email = row['email']
    user.superadmin = row['superadmin']
    user.shop_name = row['shop_name']
    user.remember_token = row['remember_token']
    user.card_brand = row['card_brand']
    user.card_last_four = row['card_last_four']
    user.trial_ends_at = row['trial_ends_at']
    user.shop_domain = row['shop_domain']
    user.is_enabled = row['is_enabled']
    user.billing_plan = row['billing_plan']
    user.trial_starts_at = row['trial_starts_at']
    user.save
    User.where(:id => row['id']).update(:password => row['password_plain'])
  end
end