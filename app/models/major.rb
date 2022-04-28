class Major < ApplicationRecord
  belongs_to :programme
  has_many :requirement_groups, as: :requirement_groupable
  
  validates :name, presence: true, uniqueness: true

  def has_requirement_group?
    requirement_groups.present?
  end
end
