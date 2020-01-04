class Product < ApplicationRecord
	has_many :stores, through: :stores_products
end