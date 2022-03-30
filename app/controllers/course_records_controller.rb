class CourseRecordsController < ApplicationController
   def index
      @course_records = CourseRecord.where(user_id: current_user.id)
   end

   def show
      @course_record = CourseRecord.where(id: params[:id])[0]
   end
   
   def new
      @course_record = CourseRecord.new
   end

   def create
      #Add student ID as user ID to parameters to save to course record
      @cr_params = course_record_params.merge!(user_id: params[:student_id])
      puts @cr_params
      @course_record = CourseRecord.new(@cr_params)
      if @course_record.save
         redirect_to @course_record
      else
         render :new, status: :unprocessable_entity
      end
   end

   private
      def course_record_params
         params.require(:course_record).permit(:course_id,
                        :term, :grade)
      end
end
