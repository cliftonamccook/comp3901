class Term < ApplicationRecord
  SEMESTERS = [1, 2, 3]

  validates_presence_of :start_year, :end_year
end
