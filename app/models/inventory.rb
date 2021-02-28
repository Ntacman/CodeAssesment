class Inventory < ApplicationRecord
  monetize :price_cents
  monetize :cost_cents
  monetize :sale_price_cents
  has_one :product, :foreign_key => :id, :primary_key => :product_id

  filterrific(
   default_filter_params: { sorted_by: 'product_id_asc' },
   available_filters: [
     :sorted_by,
     :search_query,
     :with_country_id,
     :with_created_at_gte
   ]
 )
end
