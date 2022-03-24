class CourseRecordsController < ApplicationController
   def index
      @course_record = CourseRecord.joins(:Course).where(user_id: current_user.id)
   end

   def show
      @course_record = CourseRecord.joins(:Course).where(id: params[:id])
   end
   
   def new
      @course_record = CourseRecord.new
   end

   def create
      CourseRecord.new(course_record_params)
      if @course_record.save
         redirect_to @course_record
      else
         render :new, status: :unprocessable_entity
      end
   end
end
