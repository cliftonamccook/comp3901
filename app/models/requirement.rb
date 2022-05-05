class Requirement < ApplicationRecord
  belongs_to :requirement_group

  OPERATIONS = ['AND', 'OR']
  
  has_rich_text :description
  
  validates :minimum_amount_of_credits, numericality: { greater_than: 0 }, if: :not_only_description?
  validates :operation, presence: true
  validates :course_ids, presence: true, if: :not_only_description?

  def not_only_description?
    puts(!description_only?)
    !description_only?
  end
end
