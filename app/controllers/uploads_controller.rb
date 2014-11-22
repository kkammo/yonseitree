class UploadsController < ApplicationController
	include Transloadit::Rails::ParamsDecoder
	before_filter :require_permit
  
  def new
  	@d_id = params[:dh_id]
  end

  def create
  	Rails.logger.info("PARAMS: #{params[:transloadit]}")
  	@flash = params[:upload][:d_id]
  end

end
