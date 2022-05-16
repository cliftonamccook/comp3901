class CoursesController < ApplicationController
  include UsersHelper

  before_action :set_course, only: %i[ show edit update discontinue continue ]
  before_action :authenticate_user!, except: %i[show]
  before_action :only_staff_members, except: %i[show]

  def index
    @courses = Course.all
  end

  def show
  end

  def new
    @course = Course.new
  end

  def edit
  end

  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        @course.requirement_groups.create(name: "Pre-requisites")
        format.html { redirect_to @course.requirement_groups.first, notice: "Course was successfully created." }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to course_url(@course), notice: "Course was successfully updated." }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  def discontinue
    @course.discontinue
    redirect_to request.referrer, notice: "Course discontinued successfully"
  end

  def continue
    @course.continue
    redirect_to request.referrer, notice: "Course continued successfully"
  end

  private
    def set_course
      @course = Course.find(params[:id])
    end

    def course_params
      params.require(:course).permit(:name, :code, :description, :credit_amount, :level, :discontinued, :department_id, :requirement_id, :term_id, :semester_offered_in)
    end
end
