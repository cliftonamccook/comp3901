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

   # GET students/course_records/1/edit
   def edit
      @course_record = CourseRecord.where(id: params[:id])[0]
   end

   #POST students/1/course_records
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

   #PATCH students/1/course_records/1
   def update
      @course_record = CourseRecord.where(id: params[:id])[0]
      #Add student ID as user ID to parameters to save to course record
      @cr_params = course_record_params.merge!(user_id: params[:student_id])
      puts @cr_params
      if @course_record.update(@cr_params)
         redirect_to @course_record
      else
         render :edit, status: :unprocessable_entity
      end
   end

   private
      def course_record_params
         params.require(:course_record).permit(:course_id,
                        :term, :grade)
      end
end
