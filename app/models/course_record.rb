class CourseRecord < ApplicationRecord
  belongs_to :user
  belongs_to :course

  GRADE = ['A+', 'A', 'A-', 'B+', 'B', 'B-', 'C+', 'C', 'C-', 'F1', 'F2', 'F3']

  validates_presence_of :term_id, :course, :grade, :semester

  def term_to_human
    "#{term.start_year}-#{term.end_year}-S#{semester}"
  end

  def term
    Term.find(term_id)
  end

  def as_json(options = {})
    {
      name: course.name,
      code: course.code,
      grade: grade,
      term: term_to_human
    }
  end
end
