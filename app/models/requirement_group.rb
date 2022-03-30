class RequirementGroup < ApplicationRecord
  belongs_to :requirement_groupable, polymorphic: true, optional: true
  has_many :requirement_groups, as: :requirement_groupable, dependent: :destroy
  has_many :requirements, dependent: :destroy
end
