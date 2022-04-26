class Course < ApplicationRecord
  belongs_to :department

  enum level: [:level_one, :level_two, :level_three]
  enum semester_offered_in: [:semester_one, :semester_two, :both]

  validates_presence_of :name, :code, :description, :credit_amount, :level, :semester_offered_in
  validates :credit_amount, numericality: { greater_than: 0 }

  def discontinue
    update(discontinued: true)
  end

  def continue
    update(discontinued: false)
  end
end
