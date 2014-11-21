class UploadsController < ApplicationController
	include Transloadit::Rails::ParamsDecoder
  
  def new
  	# params[:directory_homework_id]
  end

  def create
  	Rails.logger.info("PARAMS: #{params[:transloadit]}")
  	@flash = params[:upload][:d_id]
  end

end
