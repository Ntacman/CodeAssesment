class Product < ApplicationRecord
  has_many :orders, :foreign_key => :product_id
  has_many :inventories, :foreign_key => :product_id
  validates :product_name, :presence => true
  validates :style, :presence => true
  validates :brand, :presence => true
  validates :shipping_price, :presence => true
  validates :admin_id, :presence => true
end
