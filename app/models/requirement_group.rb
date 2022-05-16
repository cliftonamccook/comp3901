class RequirementGroup < ApplicationRecord
  include CoursesHelper

  
  belongs_to :requirement_groupable, polymorphic: true, optional: true
  has_many :requirement_groups, as: :requirement_groupable, dependent: :destroy
  has_many :requirements, dependent: :destroy

  has_rich_text :description

  OPERATIONS = ['AND', 'OR']

  def has_requirements?
    requirements.present?
  end
  
  def has_requirement_groups?
    requirement_groups.present?
  end

  def parent(model)
    model.name == requirement_groupable_type
  end

  def as_json(options = {})
    {
      name: name,
      code: "#{name.first}#{id}",
      operation: "AND",
      minimum_credits: requirements.pluck(:minimum_amount_of_credits).compact.sum,
      requirements: requirements.order('created_at ASC').as_json
    }
  end
end
