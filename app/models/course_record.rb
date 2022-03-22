class CourseRecord < ApplicationRecord
  belongs_to :user
  belongs_to :course
  enum term: [:1,:2,:3]
end
