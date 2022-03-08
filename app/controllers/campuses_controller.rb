class CampusesController < ApplicationController
  before_action :set_campus, only: %i[ show edit update destroy ]

  # GET /campuses or /campuses.json
  def index
    @campuses = Campus.all
  end

  # GET /campuses/1 or /campuses/1.json
  def show
  end

  # GET /campuses/new
  def new
    @campus = Campus.new
  end

  # GET /campuses/1/edit
  def edit
  end

  # POST /campuses or /campuses.json
  def create
    @campus = Campus.new(campus_params)

    respond_to do |format|
      if @campus.save
        format.html { redirect_to campus_url(@campus), notice: "Campus was successfully created." }
        format.json { render :show, status: :created, location: @campus }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @campus.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /campuses/1 or /campuses/1.json
  def update
    respond_to do |format|
      if @campus.update(campus_params)
        format.html { redirect_to campus_url(@campus), notice: "Campus was successfully updated." }
        format.json { render :show, status: :ok, location: @campus }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @campus.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /campuses/1 or /campuses/1.json
  def destroy
    @campus.destroy

    respond_to do |format|
      format.html { redirect_to campuses_url, notice: "Campus was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_campus
      @campus = Campus.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def campus_params
      params.require(:campus).permit(:name)
    end
end
