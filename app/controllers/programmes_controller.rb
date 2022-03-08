class ProgrammesController < ApplicationController
  before_action :set_programme, only: %i[ show edit update destroy ]

  # GET /programmes or /programmes.json
  def index
    @programmes = Programme.all
  end

  # GET /programmes/1 or /programmes/1.json
  def show
  end

  # GET /programmes/new
  def new
    @programme = Programme.new
  end

  # GET /programmes/1/edit
  def edit
  end

  # POST /programmes or /programmes.json
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

  # PATCH/PUT /programmes/1 or /programmes/1.json
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

  # DELETE /programmes/1 or /programmes/1.json
  def destroy
    @programme.destroy

    respond_to do |format|
      format.html { redirect_to programmes_url, notice: "Programme was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_programme
      @programme = Programme.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def programme_params
      params.require(:programme).permit(:name, :department_id)
    end
end
