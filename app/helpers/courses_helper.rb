module CoursesHelper
  def discontinue_or_continue_course_options(course)
    return link_to link_to "Discontinue Course", discontinue_course_path(course), method: :patch, class: 'btn btn-danger', data: { confirm: 'Are you sure?' } if !course.discontinued?
    return link_to "Continue Course", continue_course_path(course), method: :patch, class: 'btn btn-success', data: { confirm: 'Are you sure?' } if course.discontinued?
  end

  def total_credits(course_ids)
    Course.find(course_ids).pluck(:credit_amount).sum
  end
end
