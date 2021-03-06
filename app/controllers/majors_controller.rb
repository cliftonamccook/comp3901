class MajorsController < ApplicationController
  before_action :set_major, only: %i[ show edit update destroy ]

  def index
    @majors = Major.all
  end

  def show
  end

  def new
    @major = Major.new

    if params[:programme].present?
      @programme = Programme.find(params[:programme])
    end
  end

  def edit
  end

  def create
    @major = Major.new(major_params)

    respond_to do |format|
      if @major.save
        make_association(params[:major][:requirement_groups].reject(&:blank?), @major)

        format.html { redirect_to @major.programme, notice: "Major was successfully created." }
        format.json { render :show, status: :created, location: @major }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @major.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @major.update(major_params)
        format.html { redirect_to @major.programme, notice: "Major was successfully updated." }
        format.json { render :show, status: :ok, location: @major }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @major.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @major.destroy

    respond_to do |format|
      format.html { redirect_to majors_url, notice: "Major was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_major
      @major = Major.find(params[:id])
    end

    def major_params
      params.require(:major).permit(:name, :programme_id, :term_id)
    end

    
    def make_association(ids, major)
      @requirement_groups = RequirementGroup.find(ids)

      @requirement_groups.each do |requirement_group|
        @saved_rg = major.requirement_groups.create(requirement_group.dup.attributes)
        requirement_group.requirements.each do |requirement|
          @saved_rg.requirements.create(requirement.dup.attributes)
        end
      end
    end
end
