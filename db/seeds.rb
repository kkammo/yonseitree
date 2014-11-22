# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts 'SETTING UP ADMIN USER'
user = User.create! :student_id => '001234', :user_name => 'admin', :email => 'admin@ex.com', :password => 'zx001234', :password_confirmation => 'zx001234', :permit => true, :role => 'admin'
puts 'New user created: ' << user.user_name

u1 = User.create! :student_id => '2010999001', :user_name => '설리', :email => 'student1@ex.com', :password => 'zx001234', :password_confirmation => 'zx001234', :permit => true
u2 = User.create! :student_id => '2010999002', :user_name => '민아', :email => 'student2@ex.com', :password => 'zx001234', :password_confirmation => 'zx001234'
u3 = User.create! :student_id => '2010999003', :user_name => '효리', :email => 'student3@ex.com', :password => 'zx001234', :password_confirmation => 'zx001234'

ta1 = User.create! :student_id => '2010999004', :user_name => '소공조교', :email => 'student4@ex.com', :password => 'zx001234', :password_confirmation => 'zx001234', :permit => true, :role => 'ta'
ta2 = User.create! :student_id => '2010999005', :user_name => '디비조교', :email => 'student5@ex.com', :password => 'zx001234', :password_confirmation => 'zx001234', :permit => true, :role => 'ta'


ds0 = DirectorySemester.create! :semester_name => "2014-spring"
ds1 = DirectorySemester.create! :semester_name => "2014-fall"


dc0 = DirectoryClass.create! :class_name => "소프트웨어 공학", :directory_semester_id => ds1.id, :user_id => ta1.id
dc1 = DirectoryClass.create! :class_name => "데이터베이스", :directory_semester_id => ds1.id, :user_id => ta2.id

se_hw0 = DirectoryHomework.create! :class_name => "중간 프로젝트", :directory_class_id => dc0.id, :user_id => ta1.id
se_hw1 = DirectoryHomework.create! :class_name => "기말 프로젝트", :directory_class_id => dc0.id, :user_id => ta1.id


hw1_p1 = Project.create! :project_name => "기말 프로젝트 - 진순조", :description => "진순조 기말 프로젝트 입니다. 코드는 루비 2.1.2 환경에서 실행 가능 합니다.", :user_name => u1.user_name, :user_id => u1.id, :directory_homework_id => se_hw1.id, :codefile => "http://yonseitree.s3.amazonaws.com/19/23e850721911e4ba50e114c868b8d3/project.rb"
hw0_p1 = Project.create! :project_name => "중간 프로젝트 - 진순조", :description => "진순조 중간 프로젝트 입니다. 코드는 루비 2.1.2 환경에서 실행 가능 합니다.", :user_name => u1.user_name, :user_id => u1.id, :directory_homework_id => se_hw0.id, :codefile => "http://yonseitree.s3.amazonaws.com/19/23e850721911e4ba50e114c868b8d3/project.rb"