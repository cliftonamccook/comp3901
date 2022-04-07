class PermissionGroup < ApplicationRecord
  has_many :permissions, dependent: :destroy
  belongs_to :user, optional: true
end
