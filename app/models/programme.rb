class Programme < ApplicationRecord
  belongs_to :department
  has_many :requirement_groups, as: :requirement_groupable

  validates :name, presence: true, uniqueness: true
end 
