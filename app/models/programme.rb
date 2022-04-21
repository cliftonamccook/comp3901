class Programme < ApplicationRecord
  belongs_to :department
  has_many :requirement_groups, as: :requirement_groupable
  has_many :majors, dependent: :destroy
  has_many :minors, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end 
