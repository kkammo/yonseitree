class HomeController < ApplicationController

  # 메인 화면
  def index
  	if current_user # 로그인 여부 확인
  		if current_user.permit # 유저 승인 여부 확인
  			require_permit
        # 학기 디렉토리와 나의 프로젝트를 출력
  			@directory_semesters = DirectorySemester.all.order('semester_name ASC')
  			@projects = Project.where(user_id:current_user.id).all if Project.all.count > 0
  			@projects = Kaminari.paginate_array(@projects).page(params[:page]).per(5) unless @projects.nil?
      else # 유저 비승인 시
        sign_out current_user
        flash[:permit_not] = "관리자의 승인 이후 이용 가능합니다."
  		end
   	end  	
  end
end
