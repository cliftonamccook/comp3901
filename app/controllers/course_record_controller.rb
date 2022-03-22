class CourseRecordController < ApplicationController
   def index
      @course_record = CourseRecord.all
   end

   def show
      @course_record = CourseRecord.find(params[:id])
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
