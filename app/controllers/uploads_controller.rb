class UploadsController < ApplicationController
	include Transloadit::Rails::ParamsDecoder
	before_filter :require_permit
  
  # 업로드 경로 생성
  def new
  	@d_id = params[:dh_id] #디렉토리 아이디 설정
  end

  # 커밋시 업로드 경로 생성
  def commit
  	@d_id = params[:directory_homework_id] # 디렉토리 아이디 설정
  	@parent_id = params[:id] # 상위 프로젝트 아이디 설정
  end

  # 업로드 완료 후 이동
  def create
    # 업로드 결과에 대한 정보를 로그로 남김
  	Rails.logger.info("PARAMS: #{params[:transloadit]}")
  	@flash = params[:upload][:d_id] # 디렉토리 아이디 설정
  	@parent = params[:upload][:parent_id] # 상위 프로젝트 아이디 설정
  end

end
