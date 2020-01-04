class StoreController < ApplicationController

  def search
    stores = Store.near_by(params[:latitude].to_f, params[:longitude].to_f, 100)
    stores = stores.select{|store| current_product_available?(store)}
    user_location = [params[:latitude].to_f, params[:longitude].to_f]
    stores.each do |store|
      stop_location = [store.latitude.to_f, store.longitude.to_f]
      store.distance_in_meter = distance(stop_location, user_location)
    end
    sorted_stores = stores.sort_by{ |store| store.distance_in_meter}
    render json: sorted_stores, status: 200
  end

  private
  def current_product_available?(store)
    StoresProduct.find_by(store: store, product_id: params[:product_id]).present?
  end

  def distance(loc1, loc2)
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
