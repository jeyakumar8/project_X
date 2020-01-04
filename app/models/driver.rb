class Driver < ApplicationRecord
	has_many :stores_drivers
	has_many :stores, through: :stores_drivers
end