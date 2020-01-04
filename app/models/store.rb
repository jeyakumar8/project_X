class Store < ApplicationRecord
  has_many :stores_products
	has_many :products, through: :stores_products
end