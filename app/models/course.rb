class Course < ApplicationRecord
  belongs_to :department
  has_many :requirement_groups, as: :requirement_groupable

  enum level: [:level_zero, :level_one, :level_two, :level_three]

  has_rich_text :description

  validates_presence_of :name, :code, :description, :credit_amount, :semester_offered_in
  validates :credit_amount, numericality: { greater_than_or_equal: 0 }

  def discontinue
    update(discontinued: true)
  end

  def continue
    update(discontinued: false)
  end

  def has_requirement_groups?
    requirement_groups.present?
  end

  def self.not_discontinued
    self.where(discontinued: false)
  end

  def as_json(options = {})
    {
      name: name,
      code: code,
      semester: semester_offered_in,
      credits: credit_amount,
      campus: department.faculty.campus.name,
      faculty: department.faculty.name
    }
  end

  def convert_semester_offered_in_to_json
    if semester_one?
      [1]
    elsif semester_two?
      [2]
    else
     [1,2]  
    end
  end

  def student_eligibility
    # finish this function
  end
end

