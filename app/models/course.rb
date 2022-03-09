class Course < ApplicationRecord
  belongs_to :department
  belongs_to :requirement, optional: true

  enum level: [:one, :two, :three]
  enum semester_offered_in: [:one, :two, :both]
end
