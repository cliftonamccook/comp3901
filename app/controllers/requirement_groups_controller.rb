class RequirementGroupsController < ApplicationController
  before_action :set_requirement_group, only: %i[ show edit update destroy ]

  def index
    @requirement_groups = RequirementGroup.all
  end

  def show
  end

  def new
    @requirement_group = RequirementGroup.new
    @requirement_groupable = find_requirement_groupable
  end

  def edit
    @requirement_groupable = find_requirement_groupable
  end

  def create
    @requirement_groupable = find_requirement_groupable
    @requirement_group = @requirement_groupable.requirement_groups.new(requirement_group_params)

    respond_to do |format|
      if @requirement_group.save
        format.html { redirect_to @requirement_groupable, notice: "Requirement group was successfully created." }
        format.json { render :show, status: :created, location: @requirement_group }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @requirement_group.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @requirement_group.update(requirement_group_params)
        format.html { redirect_to programme_requirement_group_url(@requirement_group), notice: "Requirement group was successfully updated." }
        format.json { render :show, status: :ok, location: @requirement_group }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @requirement_group.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @requirement_group.destroy

    respond_to do |format|
      format.html { redirect_to requirement_groups_url, notice: "Requirement group was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  #gets the type of requirement group to create
  def find_requirement_groupable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end

  private
    def set_requirement_group
      @requirement_group = RequirementGroup.find(params[:id])
    end

    def requirement_group_params
      params.require(:requirement_group).permit(:name, :requirement_groupable_id, :requirement_groupable_type, :description, :operation)
    end
end
