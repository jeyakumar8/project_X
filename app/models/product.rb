class Product < ApplicationRecord
  has_many :stores_products
	has_many :stores, through: :stores_products
end