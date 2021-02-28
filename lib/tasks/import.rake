namespace :import do
  desc "Import order data"
  task orders: :environment do
    CSV.foreach('./data/orders.csv').with_index do |row, index|
      next if index == 0 # Skip Header Row
      # 0"id",
      # 1"product_id",
      # 2"inventory_id",
      # 3"street_address",
      # 4"apartment",
      # 5"city",
      # 6"state",
      # 7"country_code",
      # 8"zip",
      # 9"phone_number",
      # 10"email",
      # 11"name",
      # 12"order_status",
      # 13"payment_ref",
      # 14"transaction_id",
      # 15"payment_amt_cents",
      # 16"ship_charged_cents",
      # 17"ship_cost_cents",
      # 18"subtotal_cents",
      # 19"total_cents",
      # 20"shipper_name",
      # 21"payment_date",
      # 22"shipped_date",
      # 23"tracking_number",
      # 24"tax_total_cents",

      ord = Order.new
      ord.id = row[0]
      ord.product_id = row[1]
      ord.inventory_id = row[2]
      ord.street_address = row[3]
      ord.apartment = row[4]
      ord.city = row[5]
      ord.state = row[6]
      ord.country_code = row[7]
      ord.zip = row[8]
      ord.phone_number = row[9]
      ord.email = row[10]
      ord.name = row[11]
      ord.order_status = row[12]
      ord.payment_ref = row[13]
      ord.transaction_id = row[14]
      ord.payment_amt_cents = row[15]
      ord.ship_charged_cents = row[16]
      ord.ship_cost_cents = row[17]
      ord.subtotal_cents = row[18]
      ord.total_cents = row[19]
      ord.shipper_name = row[20]
      ord.payment_date = row[21]
      ord.shipped_date = row[22]
      ord.tracking_number = row[23]
      ord.tax_total_cents = row[24]
      ord.save!
      p "Created #{index} orders" if index % 1000 == 0
    end
  end

  desc "Import product data"
  task products: :environment do
    CSV.foreach('./data/products.csv', :headers => true).with_index do |row, index|
      # "id","product_name","description","style","brand","created_at","updated_at","url","product_type","shipping_price","note","admin_id"
      prod = Product.new
      prod.id = row['id']
      prod.product_name = row['product_name']
      prod.description = row['description']
      prod.style = row['style']
      prod.brand = row['brand']
      prod.url = row['url']
      prod.product_type = row['product_type']
      prod.shipping_price = row['shipping_price']
      prod.note = row['note']
      prod.admin_id = row['admin_id']
      prod.save
      p "Created #{index} products" if index % 1000 == 0
    end
  end

  desc "Import inventory data"
  task inventory: :environment do
    CSV.foreach('./data/inventory.csv').with_index do |row, index|
      next if index == 0 # Skip Header Row
      # "id","product_id","quantity","color","size","weight","price_cents","sale_price_cents","cost_cents","sku","length","width","height","note"
      inv = Inventory.new
      inv.id = row[0]
      inv.product_id = row[1]
      inv.quantity = row[2]
      inv.color = row[3]
      inv.size = row[4]
      inv.weight = row[5]
      inv.price_cents = row[6]
      inv.sale_price_cents = row[7]
      inv.cost_cents = row[8]
      inv.sku = row[9]
      inv.length = row[10]
      inv.width = row[11]
      inv.height = row[12]
      inv.note = row[13]
      inv.save
      p "Created #{index} inventory items" if index % 1000 == 0
    end
  end

  desc "Import user data"
  task users: :environment do
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
      user.update(:password => row['password_plain'])
      p 'Created user:', user.name
    end
  end

  desc "Import all data"
  task :all => [:users, :inventory, :products, :orders] do
  end

end
