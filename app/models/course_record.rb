class CourseRecord < ApplicationRecord
  belongs_to :user
  belongs_to :course
  enum term: {term_1: 1,term_2: 2,term_3: 3}
end
