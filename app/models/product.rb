class Product < ApplicationRecord
  has_many :orders, :foreign_key => :product_id
  has_many :inventories, :foreign_key => :product_id
end
