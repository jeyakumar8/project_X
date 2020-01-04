class StoresProduct < ApplicationRecord
  belongs_to :store, inverse_of: :stores_products
  belongs_to :product, inverse_of: :stores_products
end