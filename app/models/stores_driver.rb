class StoresDriver < ApplicationRecord
  belongs_to :store, inverse_of: :stores_drivers
  belongs_to :driver, inverse_of: :stores_drivers
 end