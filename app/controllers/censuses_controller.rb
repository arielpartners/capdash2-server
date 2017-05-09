class CensusesController < ApplicationController
  def utilization
    results = Census.utilization_averages
    render json: results
  end

  def show
    @census = Census.order(created_at: :desc).where(
      shelter_building_id: params[:building],
      shelter_date: Date.strptime(params[:shelter_date], '%m/%d/%Y')
    ).first
    if @census
      render json: @census
    else
      render status: 404
    end
  end
end
