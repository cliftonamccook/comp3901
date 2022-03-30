# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Campus.create(name: "Mona")
Faculty.create(name: "Science and Technology", campus_id: 1)
Department.create(name: "Computing", faculty_id: 1)
User.create(email: "dexter@example.com", campus_id: 1, department_id: 1, title: "Mr", first_name: "Dexter", uwi_id: 620114071, 
            last_name: "Small", gender: User::GENDER[0], account_type: User::account_types[:staff_admin], password: User::DEFAULT_PASSWORD)

#for course records testing
Programme.create(name:"Test Programme", department_id: 1)
RequirementGroup.create(name: "Test Req Group", requirement_groupable_type: Programme, 
                        requirement_groupable_id: 1)
Requirement.create(requirement_group_id: 1)

Course.create(name: 'Test Course', code:'TEST1111', description: 'Test Course', credit_amount: 3, level: 2,
              semester_offered_in: 1, department_id: 1, requirement_id: 1)
Course.create(name: 'Test Course 2', code:'TEST2222', description: 'Test Course', credit_amount: 3, level: 2,
              semester_offered_in: 2, department_id: 1, requirement_id: 1)
CourseRecord.create(user_id: 1, course_id: 2, grade: 'A+', term: 1)
CourseRecord.create(user_id: 1, course_id: 3, grade: 'B+', term: 1)
