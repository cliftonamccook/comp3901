class ProgrammesController < ApplicationController
  before_action :set_programme, only: %i[ show edit update destroy ]

  def index
    @programmes = Programme.all
  end

  def show
    if params[:view].present? 
      @objects = params[:view] == "major" ? @programme.majors : @programme.minors
    end
  end

  def new
    @programme = Programme.new
  end

  def edit
  end

  def create
    @programme = Programme.new(programme_params)

    respond_to do |format|
      if @programme.save
        format.html { redirect_to programme_url(@programme), notice: "Programme was successfully created." }
        format.json { render :show, status: :created, location: @programme }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @programme.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @programme.update(programme_params)
        format.html { redirect_to programme_url(@programme), notice: "Programme was successfully updated." }
        format.json { render :show, status: :ok, location: @programme }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @programme.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @programme.destroy

    respond_to do |format|
      format.html { redirect_to programmes_url, notice: "Programme was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_programme
      @programme = Programme.find(params[:id])
    end

    def programme_params
      params.require(:programme).permit(:name, :department_id)
    end
end
