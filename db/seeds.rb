# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Person.create([{id_number: "25", email: "25", first_name: "Abby", password: "Abby", id: 9}])
Person.create([{id_number: "8", email: "8", first_name: "Abigail", password: "Abigail", id: 10}])
Person.create([{id_number: "14", email: "14", first_name: "Abigail", password: "Abigail", id: 11}])
Person.create([{id_number: "21", email: "21", first_name: "Ava", password: "Ava", id: 12}])
Person.create([{id_number: "6", email: "6", first_name: "Camille", password: "Camille", id: 13}])
Person.create([{id_number: "17", email: "17", first_name: "Colette", password: "Colette", id: 14}])
Person.create([{id_number: "16" , email: "16 ", first_name: "Colin", password: "Colin", id: 15}])
Person.create([{id_number: "4", email: "4", first_name: "Curtis", password: "Curtis", id: 16}])
Person.create([{id_number: "15", email: "15", first_name: "Dasom", password: "Dasom", id: 17}])
Person.create([{id_number: "2", email: "2", first_name: "Elizabeth", password: "Elizabeth", id: 18}])
Person.create([{id_number: "5", email: "5", first_name: "Erica", password: "Erica", id: 19}])
Person.create([{id_number: "12", email: "12", first_name: "Evaline", password: "Evaline", id: 20}])
Person.create([{id_number: "7", email: "7", first_name: "Grace", password: "Grace", id: 21}])
Person.create([{id_number: "23", email: "23", first_name: "Grant", password: "Grant", id: 22}])
Person.create([{id_number: "18", email: "18", first_name: "Hannah", password: "Hannah", id: 23}])
Person.create([{id_number: "24", email: "24", first_name: "Jacob", password: "Jacob", id: 24}])
Person.create([{id_number: "10", email: "10", first_name: "Jalen", password: "Jalen", id: 25}])
Person.create([{id_number: "20", email: "20", first_name: "Jessica", password: "Jessica", id: 26}])
Person.create([{id_number: "13", email: "13", first_name: "Jiwon", password: "Jiwon", id: 27}])
Person.create([{id_number: "9", email: "9", first_name: "Joseph", password: "Joseph", id: 28}])
Person.create([{id_number: "1", email: "1", first_name: "Katie", password: "Katie", id: 29}])
Person.create([{id_number: "3", email: "3", first_name: "Margot", password: "Margot", id: 30}])
Person.create([{id_number: "19", email: "19", first_name: "Mason", password: "Mason", id: 31}])
Person.create([{id_number: "22", email: "22", first_name: "Nathan", password: "Nathan", id: 32}])
Person.create([{id_number: "11", email: "11", first_name: "Petra", password: "Petra", id: 33}])
Person.create([{id_number: "26", email: "26", first_name: "Taylor", password: "Taylor", id: 34}])
students = Person.all

michael = Person.create([{id: 999, first_name: "Michael", password:"Michael", id_number: "37", email: "37"}])
collin = Person.create([{id: 9999, first_name: "Collin", password: "Collin", id_number: "42", email: "42"}])
mindy = Person.create([{id: 100, first_name: "Mindy", password: "Mindy", id_number: "100", email: "100"}])


Course.create([{id: 1, name: "Earth Science"}])

Course.create([{id: 2, name: "Algebra 1"}])

Course.create([{id: 3, name: "Social Studies"}])

englishCourse = Course.create([{id: 4, name: "Language Arts"}])

Course.create([{id: 5, name: "Computational Thinking"}])

holman = School.create([{id: 1, name: "Holman Middle School", time_zone: "Eastern Time (US & Canada)"}])

School.create([{id: 2, name: "Fairfield Middle School", time_zone: "Eastern Time (US & Canada)"}])

School.create([{id: 3, name: "Otherone Middle School", time_zone: "Eastern Time (US & Canada)"}])

School.create([{id: 4, name: "Virginia Tech", time_zone: "Eastern Time (US & Canada)"}])

s = Section.create([{id: 1, course_id: englishCourse.id, school_id: holman.id, teacher_id: mindy.id}])


adminRole = Role.create([{id: 1, name: "SuperAdmin"}])
Role.create([{id: 2, name: "SchoolAdmin"}])
teacherRole = Role.create([{id: 3, name: "Teacher"}])
studentRole = Role.create([{id: 4, name: "Student"}])

students.each do |person|
  SectionAssignment.create([{person_id: person.id, section_id: s.id}]) 
  RoleAssignment.create([{person_id: person.id, role_id:studentRole.id}]) 
end

RoleAssignment.create([{person_id: mindy.id, role_id:teacherRole.id}]) 
RoleAssignment.create([{person_id: michael.id, role_id:adminRole.id}]) 
RoleAssignment.create([{person_id: collin.id, role_id:adminRole.id}]) 

RatingValue.create([{id: 1, name: "up"}])
RatingValue.create([{id: 2, name: "down"}])

CourseOffering.create([{id: 1, course_id: englishCourse.id, school_id: holman}])
  