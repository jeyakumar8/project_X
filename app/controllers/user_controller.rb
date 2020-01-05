class UserController < ApplicationController
# skip_before_action :verify_authenticity_token
  def create_user
    permit_params
    p params
    # debugger
    user = User.new(params)
    if(user.save)
      render :json => {:id => user.id}.to_json
      return
    end
  rescue => e
  	p e
    Rails.logger.error "Error occured"
    render :json => {:message => "ERROR"}.to_json
  end


  def permit_params
    params.permit(:name, :latitude, :longitude)
  end


end
