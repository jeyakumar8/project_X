class Store < ApplicationRecord
	has_many :products, through: :stores_products
end