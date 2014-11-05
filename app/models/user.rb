class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login]

  has_many :projects

 	validates :student_id, presence: true, length: {maximum: 10}, uniqueness: { case_sensitive: false }, format: { with: /[0-9]*/, message: "may only contain numbers." }

  attr_accessor :login

  def self.find_first_by_auth_conditions(warden_conditions)
  	conditions = warden_conditions.dup
  	if login = conditions.delete(:login)
    	where(conditions).where(["student_id = :value OR lower(email) = lower(:value)", { :value => login }]).first
  	else
    	where(conditions).first
  	end
	end

end
