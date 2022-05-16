class HomeController < ApplicationController
  include UsersHelper
  include Pagy::Backend

  def index
    @pagy, @records = pagy(Course.not_discontinued)

    if params[:search].present? and params[:search][:for].present?
      if params[:search][:for] == 'programme'
        @pagy, @records = pagy(Programme.where("lower(name) LIKE ?", "%" + params[:search][:keyword].downcase + "%"))        
      end
      if params[:search][:for] == 'course'
        @pagy, @records = pagy(Course.where("lower(code) LIKE ?", "%" + params[:search][:keyword].downcase + "%"))        
      end

      if params[:search][:for] == 'major'
        @pagy, @records = pagy(Major.where("lower(name) LIKE ?", "%" + params[:search][:keyword].downcase + "%"))        
      end

      if params[:search][:for] == 'minor'
        @pagy, @records = pagy(Minor.where("lower(name) LIKE ?", "%" + params[:search][:keyword].downcase + "%"))
      end                        
    end
  end

  def student_progress_overview
    if student_progress
      @progress_report = JSON.parse(student_progress.report)
    end
  end

  def check_progress
    if !params[:track].present?
      redirect_to student_progress_path, notice: "Something went wrong"
    end

    programme_params = params[:track][:programme]
    major_params = params[:track][:major]
    minor_params = params[:track][:minor]

    @programme = Programme.find(programme_params) if programme_params.present?
    @major = Major.find(major_params) if major_params.present?
    @minor = Minor.find(minor_params) if minor_params.present?
    @student = params[:track][:student].present? ? User.find(params[:track][:student].to_i) : current_user

    @student_progress = StudentProgress.where(user_id: @student.id).first
    if @student_progress
      @student_progress.update(report: handle_api_call(@programme, @major, @minor, @student).to_json, programme_id: @programme.id, major_id: @major.id)
    else
      StudentProgress.create(user_id: @student.id, report: handle_api_call(@programme, @major, @minor, @student).to_json, programme_id: @programme.id, major_id: @major.id)
    end

    redirect_to student_progress_overview_path
  end

  private

  def build_student_record_payload(programme, major, minor, student)
    {
      name: student.name,
      id: student.uwi_id,
      campus: student.campus.name,
      faculty: @programme.department.faculty.name,
      programme: @programme.name,
      "course records": CourseRecord.where(user_id: student.id).as_json
    }.as_json
  end

  def build_payload(programme, major, minor, student)
    [
      build_student_record_payload(programme, major, minor, student),
      {      
        name: "#{programme.name} - #{major.name}",
        code: "#{programme.name.first}#{major.name.first}#{Programme.count}",
        faculty: programme.department.faculty.name,
        operation: "AND",
        minimum_credits: Requirement.joins(:requirement_group).where(requirement_group: { requirement_groupable_id: programme.id, requirement_groupable_type: "Programme"} ).pluck(:minimum_amount_of_credits).sum,
        "requirements": programme.requirement_groups.order('created_at ASC').as_json     
      }.as_json
    ]
  end

  def handle_api_call(programme, major, minor, student)
    fast_payload = [build_student_record_payload(programme, major, minor, student), { code: "#{programme.name.first}#{major.name.first}#{Programme.count}" }.as_json]
    api_response = call_checker_api('http://127.0.0.1:8000/checker/fastcheck/', fast_payload.to_json)

    if api_response['detail'].present?
      payload = build_payload(programme, major, minor, student)
      api_response = call_checker_api('http://127.0.0.1:8000/checker/', payload.to_json)
    end 
    api_response   
  end

  def call_checker_api(url, payload)
    uri = URI(url)
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Post.new(uri.path, {'Content-Type' => 'application/json'})
    request.body = payload
    response = http.request(request)
    JSON.parse(response.body)
  end
end
