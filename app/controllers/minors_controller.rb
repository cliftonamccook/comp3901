class MinorsController < ApplicationController
  before_action :set_minor, only: %i[ show edit update destroy ]

  def index
    @minors = Minor.all
  end

  def show
  end

  def new
    @minor = Minor.new

    if params[:programme].present?
      @programme = Programme.find(params[:programme])
    end
  end

  def edit
  end

  def create
    @minor = Minor.new(minor_params)

    respond_to do |format|
      if @minor.save
        make_association(params[:minor][:requirement_groups].reject(&:blank?), @minor)
        format.html { redirect_to @minor.programme, notice: "Minor was successfully created." }
        format.json { render :show, status: :created, location: @minor }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @minor.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @minor.update(minor_params)
        format.html { redirect_to @minor.programm, notice: "Minor was successfully updated." }
        format.json { render :show, status: :ok, location: @minor }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @minor.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @minor.destroy

    respond_to do |format|
      format.html { redirect_to minors_url, notice: "Minor was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_minor
      @minor = Minor.find(params[:id])
    end

    def minor_params
      params.require(:minor).permit(:name, :programme_id, :term_id)
    end

    def make_association(ids, minor)
      @requirement_groups = RequirementGroup.find(ids)

      @requirement_groups.each do |requirement_group|
        @saved_rg = minor.requirement_groups.create(requirement_group.dup.attributes)
        requirement_group.requirements.each do |requirement|
          @saved_rg.requirements.create(requirement.dup.attributes)
        end
      end
    end
end
