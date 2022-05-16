class Requirement < ApplicationRecord
  include CoursesHelper

  belongs_to :requirement_group

  OPERATIONS = ['AND', 'OR']
  
  has_rich_text :description
  
  validates :minimum_amount_of_credits, numericality: { greater_than_or_equal: 0 }, if: :not_only_description?
  validates :operation, presence: true
  validates :course_ids, presence: true, if: :not_only_description?

  def not_only_description?
    !description_only?
  end


  def as_json(options = {})
    {
      name: "Requirement #{id}",
      code: "REQ#{id}",
      operation: minimum_amount_of_credits == total_credits(course_ids) ? Requirement::OPERATIONS[operation] : Requirement::OPERATIONS[1],
      minimum_credits: minimum_amount_of_credits,
      requirements: course_ids.map { |course_id| Course.find(course_id).as_json }
    }
  end
end
