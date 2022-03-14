class FacultiesController < ApplicationController
  include UsersHelper

  before_action :set_faculty, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action :only_admin!

  def index
    @faculties = Faculty.all
  end

  def show
  end

  def new
    @faculty = Faculty.new
  end

  def edit
  end

  def create
    @faculty = Faculty.new(faculty_params)

    respond_to do |format|
      if @faculty.save
        format.html { redirect_to faculties_path, notice: "Faculty was successfully created." }
        format.json { render :show, status: :created, location: @faculty }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @faculty.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @faculty.update(faculty_params)
        format.html { redirect_to faculties_path, notice: "Faculty was successfully updated." }
        format.json { render :show, status: :ok, location: @faculty }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @faculty.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_faculty
      @faculty = Faculty.find(params[:id])
    end

    def faculty_params
      params.require(:faculty).permit(:campus_id, :name)
    end
end
