class SampleController < ApplicationController
	def first
		p Rails.env
		Rails.logger.info "master"
		render :json => {:name => "David"}.to_json
	end
end