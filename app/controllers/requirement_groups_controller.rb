class RequirementGroupsController < ApplicationController
  before_action :set_requirement_group, only: %i[ show edit update destroy ]

  # GET /requirement_groups or /requirement_groups.json
  def index
    @requirement_groups = RequirementGroup.all
  end

  # GET /requirement_groups/1 or /requirement_groups/1.json
  def show
  end

  # GET /requirement_groups/new
  def new
    @requirement_group = RequirementGroup.new
  end

  # GET /requirement_groups/1/edit
  def edit
  end

  # POST /requirement_groups or /requirement_groups.json
  def create
    @requirement_group = RequirementGroup.new(requirement_group_params)

    respond_to do |format|
      if @requirement_group.save
        format.html { redirect_to requirement_group_url(@requirement_group), notice: "Requirement group was successfully created." }
        format.json { render :show, status: :created, location: @requirement_group }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @requirement_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requirement_groups/1 or /requirement_groups/1.json
  def update
    respond_to do |format|
      if @requirement_group.update(requirement_group_params)
        format.html { redirect_to requirement_group_url(@requirement_group), notice: "Requirement group was successfully updated." }
        format.json { render :show, status: :ok, location: @requirement_group }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @requirement_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requirement_groups/1 or /requirement_groups/1.json
  def destroy
    @requirement_group.destroy

    respond_to do |format|
      format.html { redirect_to requirement_groups_url, notice: "Requirement group was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_requirement_group
      @requirement_group = RequirementGroup.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def requirement_group_params
      params.require(:requirement_group).permit(:name, :requirement_groupable_id, :requirement_groupable_type)
    end
end
