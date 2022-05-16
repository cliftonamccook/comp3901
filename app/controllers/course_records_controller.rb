class CourseRecordsController < ApplicationController
  before_action :set_course_record, only: %i[show edit update]

  def index
    @course_records = CourseRecord.where(user_id: current_user.id)
  end

  def show
  end

  def new
    @course_record = CourseRecord.new
  end

  def edit
  end

  def create
    @course_record = CourseRecord.new(course_record_params)
    
    if @course_record.save
      redirect_to course_records_path, notice: "Course record created successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update    
    if @course_record.update(course_record_params)
      redirect_to course_records_path, notice: "Course record updated successfully"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def course_record_params
   params.require(:course_record).permit(:user_id, :course_id, :term_id, :grade, :semester)
  end

  def set_course_record
    @course_record = CourseRecord.find(params[:id])
  end
end
