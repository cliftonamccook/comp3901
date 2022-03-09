class Course < ApplicationRecord
  belongs_to :department
  belongs_to :requirement, optional: true

  enum level: [:level_one, :level_two, :level_three]
  enum semester_offered_in: [:semester_one, :semester_two, :both]
end
