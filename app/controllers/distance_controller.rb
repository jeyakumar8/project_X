class DistanceController < ApplicationController
  skip_before_action :verify_authenticity_token

  def calculate_distance
    user = params["user"]
    user_info = JSON.parse(User.find(user).to_json)
    if(!Store.exists?(params["id"]))
      render :json => {"message" => "Not present"}.to_json
      return
    end


    current_avaliable_stores = {}

    #current_avaliable_stores is all the stores return from the facilities queries
    #best_store is the best source
    
    

    render :json => Store.find(params["id"]).to_json
  end



  def proceed_to_pay
  	best_store = Store.find(params["id"])
  	best_store.current_load = best_store.current_load - 1
    
    if(best_store.save)
      Rails.logger.info "updated the current_load"
    end
    render :json => {:status_code => 200, :message => "Sucess"}.to_json
  end
end
