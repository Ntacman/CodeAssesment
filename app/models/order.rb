class Order < ApplicationRecord
  has_one :inventory, :foreign_key => :id, :primary_key => :inventory_id
  has_one :product, :foreign_key => :id, :primary_key => :product_id
  monetize :total_cents
end
