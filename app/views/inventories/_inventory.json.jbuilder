json.extract! inventory, :id, :product_id, :quantity, :color, :size, :weight, :price_cents, :sale_price_cents, :cost_cents, :sku, :length, :width, :height, :note, :created_at, :updated_at
json.url inventory_url(inventory, format: :json)
