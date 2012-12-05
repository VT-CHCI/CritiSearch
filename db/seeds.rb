# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Person.create!({id_number: "25", email: "25", first_name: "Abby", password: "Abby"})
Person.create!({id_number: "8", email: "8", first_name: "Abigail", password: "Abigail"})
Person.create!({id_number: "14", email: "14", first_name: "Abigail", password: "Abigail"})
Person.create!({id_number: "21", email: "21", first_name: "Ava", password: "Ava"})
Person.create!({id_number: "6", email: "6", first_name: "Camille", password: "Camille"})
Person.create!({id_number: "17", email: "17", first_name: "Colette", password: "Colette"})
Person.create!({id_number: "16" , email: "16 ", first_name: "Colin", password: "Colin"})
Person.create!({id_number: "4", email: "4", first_name: "Curtis", password: "Curtis"})
Person.create!({id_number: "15", email: "15", first_name: "Dasom", password: "Dasom"})
Person.create!({id_number: "2", email: "2", first_name: "Elizabeth", password: "Elizabeth"})
Person.create!({id_number: "5", email: "5", first_name: "Erica", password: "Erica"})
Person.create!({id_number: "12", email: "12", first_name: "Evaline", password: "Evaline"})
Person.create!({id_number: "7", email: "7", first_name: "Grace", password: "Grace"})
Person.create!({id_number: "23", email: "23", first_name: "Grant", password: "Grant"})
Person.create!({id_number: "18", email: "18", first_name: "Hannah", password: "Hannah"})
Person.create!({id_number: "24", email: "24", first_name: "Jacob", password: "Jacob"})
Person.create!({id_number: "10", email: "10", first_name: "Jalen", password: "Jalen"})
Person.create!({id_number: "20", email: "20", first_name: "Jessica", password: "Jessica"})
Person.create!({id_number: "13", email: "13", first_name: "Jiwon", password: "Jiwon"})
Person.create!({id_number: "9", email: "9", first_name: "Joseph", password: "Joseph"})
Person.create!({id_number: "1", email: "1", first_name: "Katie", password: "Katie"})
Person.create!({id_number: "3", email: "3", first_name: "Margot", password: "Margot"})
Person.create!({id_number: "19", email: "19", first_name: "Mason", password: "Mason"})
Person.create!({id_number: "22", email: "22", first_name: "Nathan", password: "Nathan"})
Person.create!({id_number: "11", email: "11", first_name: "Petra", password: "Petra"})
Person.create!({id_number: "26", email: "26", first_name: "Taylor", password: "Taylor"})
students = Person.all

michael = Person.create!({first_name: "Michael", password:"Michael", id_number: "37", email: "37"})
collin = Person.create!({first_name: "Collin", password: "Collin", id_number: "42", email: "42"})
mindy = Person.create!({first_name: "Mindy", password: "Mindy", id_number: "100", email: "100"})


Course.create!({name: "Earth Science"})

Course.create!({name: "Algebra 1"})

Course.create!({name: "Social Studies"})

englishCourse = Course.create!({name: "Language Arts"})

Course.create!({name: "Computational Thinking"})

holman = School.create!({name: "Holman Middle School", time_zone: "Eastern Time (US & Canada)"})

School.create!({name: "Fairfield Middle School", time_zone: "Eastern Time (US & Canada)"})

School.create!({name: "Otherone Middle School", time_zone: "Eastern Time (US & Canada)"})

School.create!({name: "Virginia Tech", time_zone: "Eastern Time (US & Canada)"})

s = Section.create!({course_id: englishCourse.id, school_id: holman.id, teacher_id: mindy.id})


adminRole = Role.create!({name: "SuperAdmin"})
Role.create!({name: "SchoolAdmin"})
teacherRole = Role.create!({name: "Teacher"})
studentRole = Role.create!({name: "Student"})

students.each do |person|
  SectionAssignment.create!({person_id: person.id, section_id: s.id}) 
  RoleAssignment.create!({person_id: person.id, role_id:studentRole.id}) 
end

RoleAssignment.create!({person_id: mindy.id, role_id:teacherRole.id}) 
RoleAssignment.create!({person_id: michael.id, role_id:adminRole.id}) 
RoleAssignment.create!({person_id: collin.id, role_id:adminRole.id}) 

RatingValue.create!({name: "up"})
RatingValue.create!({name: "down"})

CourseOffering.create!({course_id: englishCourse.id, school_id: holman})
  