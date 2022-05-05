class Course < ApplicationRecord
  belongs_to :department
  has_many :requirement_groups, as: :requirement_groupable

  enum level: [:level_one, :level_two, :level_three]
  enum semester_offered_in: [:semester_one, :semester_two, :both]

  has_rich_text :description

  validates_presence_of :name, :code, :description, :credit_amount, :level, :semester_offered_in
  validates :credit_amount, numericality: { greater_than: 0 }

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
end

