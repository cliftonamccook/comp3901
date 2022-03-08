class RequirementGroup < ApplicationRecord
  belongs_to :requirement_groupable, polymorphic: true
  has_many :requirement_groups, as: :requirement_groupable
end
