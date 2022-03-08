class Minor < ApplicationRecord
  belongs_to :programme
  has_many :requirement_groups, as: :requirement_groupable
  
  validates :name, presence: true, uniqueness: true
end
