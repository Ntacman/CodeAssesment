json.extract! product, :id, :product_name, :description, :style, :brand, :url, :product_type, :shipping_price, :note, :admin_id, :created_at, :updated_at
json.url product_url(product, format: :json)
