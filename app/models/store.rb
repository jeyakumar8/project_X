class Store < ApplicationRecord
  has_many :stores_products
  has_many :stores_drivers
  has_many :products, through: :stores_products
  has_many :drivers, through: :stores_drivers
  attr_accessor :distance_in_meter

  def self.near_by(lat, lng, radius)
  	bounding_distance = radius/111.111
    data = where("latitude BETWEEN (:lat - :bounding_distance) AND (:lat + :bounding_distance) AND longitude BETWEEN (:lng - :bounding_distance) AND (:lng + :bounding_distance) AND (6371.0 * 2 * ASIN(SQRT(POWER(SIN((:lat - latitude) * PI() / 180 / 2), 2) + COS(:lat * PI() / 180) * COS(latitude * PI() / 180) * POWER(SIN((:lng - longitude) * PI() / 180 / 2), 2)))) BETWEEN 0.0 AND :radius", lat: lat, bounding_distance: bounding_distance, lng: lng, radius:radius )
    return data
  end

  def self.distance loc1, loc2
    rad_per_deg = Math::PI/180  # PI / 180
    rkm = 6371                  # Earth radius in kilometers
    rm = rkm * 1000             # Radius in meters

    dlat_rad = (loc2[0]-loc1[0]) * rad_per_deg  # Delta, converted to rad
    dlon_rad = (loc2[1]-loc1[1]) * rad_per_deg

    lat1_rad, lon1_rad = loc1.map {|i| i * rad_per_deg }
    lat2_rad, lon2_rad = loc2.map {|i| i * rad_per_deg }

    a = Math.sin(dlat_rad/2)**2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * Math.sin(dlon_rad/2)**2
    c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1-a))

    rm * c # Delta in meters
  end
end
