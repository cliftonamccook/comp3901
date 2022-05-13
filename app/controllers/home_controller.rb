class HomeController < ApplicationController
  def index
  end

  def student_progress
  end

  def check_progress
    if !params[:track].present?
      redirect_to student_progress_path, notice: "Something went wrong"
    end

    programme_params = params[:track][:programme]
    major_params = params[:track][:major]
    minor_params = params[:track][:minor]

    @programme = Programme.find(programme_params) if programme_params.present?
    @major = Major.find(major_params) if major_params.present?
    @minor = Minor.find(minor_params) if minor_params.present?

    puts(map_payload(@programme, @major, @minor))
  end

  private

  def map_payload(programme, major, minor)
    pay_load = {
      
    }

    pay_load.to_json
  end
end
