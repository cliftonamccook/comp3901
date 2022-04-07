class Department < ApplicationRecord
  belongs_to :faculty

  validates :name, presence: true, uniqueness: true  
end
