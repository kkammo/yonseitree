class UploadsController < ApplicationController
	include Transloadit::Rails::ParamsDecoder
	before_filter :require_permit
  
  def new
  	@d_id = params[:dh_id]
  end

  def commit
  	@d_id = params[:directory_homework_id]
  	@parent_id = params[:id]
  end
  def create
  	Rails.logger.info("PARAMS: #{params[:transloadit]}")
  	@flash = params[:upload][:d_id]
  	@parent = params[:upload][:parent_id]
  end

end
