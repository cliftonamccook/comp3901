class RequirementsController < ApplicationController
  include UsersHelper
  
  before_action :set_requirement, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action :only_staff_members

  def index
    @requirements = Requirement.all
  end

  def show
  end

  def new
    @requirement = Requirement.new

    if params[:requirement_group].present?
      @requirement_group = RequirementGroup.find(params[:requirement_group])
      @courses = Course.not_discontinued
    end
  end

  def edit
    @courses = Course.not_discontinued
  end

  def create
    @requirement = Requirement.new(requirement_params)

    respond_to do |format|
      if @requirement.save
        format.html { redirect_to @requirement.requirement_group, notice: "Requirement was successfully created." }
        format.json { render :show, status: :created, location: @requirement }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @requirement.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @requirement.update(requirement_params)
        format.html { redirect_to @requirement.requirement_group, notice: "Requirement was successfully updated." }
        format.json { render :show, status: :ok, location: @requirement }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @requirement.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @requirement.destroy

    respond_to do |format|
      format.html { redirect_to requirements_url, notice: "Requirement was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private 
    def set_requirement
      @requirement = Requirement.find(params[:id])
    end

    def requirement_params
      params.require(:requirement).permit(:requirement_group_id, :operation, :minimum_amount_of_credits, :description_only, :description, course_ids: [])
    end
end
