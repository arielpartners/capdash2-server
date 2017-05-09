class CensusesController < ApplicationController
  def utilization
    results = Census.utilization_averages
    render json: results
  end

  def show
    @census = Census.find_by(
      shelter_building_id: params[:building],
      shelter_date: params[:shelter_date]
    )
    if @census
      render json: @census
    else
      render status: 404
    end
  end
end
