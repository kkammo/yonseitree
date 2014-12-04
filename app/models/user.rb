class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login]

  has_many :projects

  validates :user_name, presence: true

 	validates :student_id, presence: true, length: {maximum: 10}, uniqueness: { case_sensitive: false }, format: { with: /\A[0-9]*\z/, message: "ID는 숫자만 입력할 수 있습니다." }

  validates :role, presence: true, format: { with: /(\Astudent\z|\Ata\z|\Aadmin\z)/ }
  devise :timeoutable, :timeout_in => 60.minutes
  attr_accessor :login

  def self.find_first_by_auth_conditions(warden_conditions)
  	conditions = warden_conditions.dup
  	if login = conditions.delete(:login)
    	where(conditions).where(["student_id = :value OR lower(email) = lower(:value)", { :value => login }]).first
  	else
    	where(conditions).first
  	end
	end

  def self.permit(user_id)
    user = User.find(user_id)
    
    if user
      user.permit = true
      user.save
      true
    else
      false
    end
  end

end
