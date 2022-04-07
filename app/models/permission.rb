class Permission < ApplicationRecord
  belongs_to :department
  belongs_to :permission_group
end
