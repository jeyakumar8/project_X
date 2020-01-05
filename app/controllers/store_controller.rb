class StoreController < ApplicationController

  def search
    stores = Store.near_by(params[:latitude].to_f, params[:longitude].to_f, 100)
    stores = stores.select{|store| current_product_available?(store)}
    render json: [], status: 204 and return if stores.blank?
    user_location = [params[:latitude].to_f, params[:longitude].to_f]
    stores.each do |store|
      stop_location = [store.latitude.to_f, store.longitude.to_f]
      store.distance_in_meter = distance(stop_location, user_location)
    end
    stores.sort_by!{ |store| store.distance_in_meter}
    calculate_eta_with_traffic!(stores[0..24])
    stores.sort_by!{ |store| store.final_eta}
    render json: stores, methods: [:distance_in_meter, :final_eta], except: [:s_eta], status: 200
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

    lat1_rad, _ = loc1.map {|i| i * rad_per_deg }
    lat2_rad, _ = loc2.map {|i| i * rad_per_deg }

    a = Math.sin(dlat_rad/2)**2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * Math.sin(dlon_rad/2)**2
    c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1-a))

    rm * c # Delta in meters
  end

  def calculate_eta_with_traffic!(stores)
    initialize_matrix!
    @matrix.origins << get_location_matrix(params[:longitude].to_f, params[:latitude].to_f)
    stores.each {|store| @matrix.destinations << get_location_matrix(store.longitude.to_f, store.latitude.to_f)}
    results = (@matrix.data || []).first
    (results || []).each_with_index do |result, i|
      store = stores[i]
      store.distance_in_meter = result.distance_in_meters
      store.final_eta = result.duration_in_seconds
    end
  end

  def initialize_matrix!
    @matrix = ::GoogleDistanceMatrix::Matrix.new
    @matrix.configure do |config|
      config.mode = 'driving'
      config.avoid = 'tolls'
      config.google_api_key = ''
    end
  end

  def get_location_matrix(lng, lat)
    ::GoogleDistanceMatrix::Place.new(lng: lng, lat: lat)
  end

end
