class StudentProgress < ApplicationRecord
  belongs_to :user

  def programme
    Programme.find(programme_id)
  end

  def major
    Major.find(major_id)
  end

  def minor
    Minor.find(minor_id)
  end
end
