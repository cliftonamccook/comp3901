class PermissionGroup < ApplicationRecord
  has_many :permissions, dependent: :destroy
  
  accepts_nested_attributes_for :permissions, allow_destroy: true, reject_if: :all_blank

  validates_presence_of :name
end
