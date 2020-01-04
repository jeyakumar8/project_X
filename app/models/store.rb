class Store < ApplicationRecord
  has_many :stores_products
  has_many :stores_drivers
  has_many :products, through: :stores_products
  has_many :drivers, through: :stores_drivers

  attr_accessor :distance_in_meter

  def self.near_by(lat, lng, radius)
  	bounding_distance = radius/111.111
    where("latitude BETWEEN (:lat - :bounding_distance) AND (:lat + :bounding_distance) AND longitude BETWEEN (:lng - :bounding_distance) AND (:lng + :bounding_distance) AND (6371.0 * 2 * ASIN(SQRT(POWER(SIN((:lat - latitude) * PI() / 180 / 2), 2) + COS(:lat * PI() / 180) * COS(latitude * PI() / 180) * POWER(SIN((:lng - longitude) * PI() / 180 / 2), 2)))) BETWEEN 0.0 AND :radius", lat: lat, bounding_distance: bounding_distance, lng: lng, radius:radius )
  end
end
