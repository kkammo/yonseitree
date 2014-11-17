# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Comment.delete_all
Like.delete_all
Project.delete_all
User.delete_all
Homework.delete_all
Subject.delete_all
Semester.delete_all
User.create([{name:"Lee", email:"lee@yonsei.ac.kr", student_id:"2010147146"},
	{name:"Kim", email:"kim@yonsei.ac.kr", student_id:"2010147043"},
	{name:"Cho", email:"cho@yonsei.ac.kr", student_id:"2010147116"}])

semester = Semester.create({name:"2014-2"})
subject = Subject.create({name:"SW Engineering", semester_id:semester.id})
Homework.create([
	{name:"HW_1", subject_id:subject.id}, 
	{name:"HW_2", subject_id:subject.id}
	])
lee = User.find_by_name("Lee")
kim = User.find_by_name("Kim")
cho = User.find_by_name("Cho")
hw1 = Homework.find_by_name("HW_1")
hw2 = Homework.find_by_name("HW_2")

projects = Project.create([
		{name:hw1.name, description:%{This is for hw1 test1.}, homework:hw1, user_id:lee},
		{name:hw1.name, description:%{This is for hw1 test2.}, homework:hw1, user_id:kim},
		{name:hw2.name, description:%{This is for hw2 test1.}, homework:hw2, user_id:cho},
		{name:hw2.name, description:%{This is for hw2 test2.}, homework:hw2, user_id:cho}
		])
parent = Project.find_by_name("HW_1")
commit = Project.create(name:hw1.name, description:"This is for commit test.", homework:hw1, user_id:cho, project_id:parent)