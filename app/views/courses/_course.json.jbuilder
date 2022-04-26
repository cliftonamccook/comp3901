json.extract! course, :id, :name, :code, :description, :credit_amount, :level, :semester_offered_in, :discontinued, :department_id, :requirement_id, :created_at, :updated_at
json.url course_url(course, format: :json)
