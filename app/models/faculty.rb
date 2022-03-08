class Faculty < ApplicationRecord
  belongs_to :campus

  validates :name, presence: true, uniqueness: true
end
