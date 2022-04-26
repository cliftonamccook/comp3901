class Requirement < ApplicationRecord
  belongs_to :requirement_group

  OPERATIONS = ['AND', 'OR']

  validates :minimum_amount_of_credits, numericality: { greater_than: 0 }
  validates_presence_of :operation, :course_ids
end
