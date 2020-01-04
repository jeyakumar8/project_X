class Store < ApplicationRecord
	has_many :stores_products
	has_many :stores_drivers
	has_many :products, through: :stores_products
	has_many :drivers, through: :stores_drivers
end