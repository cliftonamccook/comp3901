class Department < ApplicationRecord
  belongs_to :faculty
  has_many :users

  validates :name, presence: true, uniqueness: true  
end
