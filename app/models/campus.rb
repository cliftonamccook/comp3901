class Campus < ApplicationRecord
  has_many :users, dependent: :destroy

end
