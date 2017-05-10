class CensusesController < ApplicationController
  def utilization
    results = Census.utilization_averages
    render json: results
  end

  def show
    as_of = params[:as_of] || Date.today
    @census = Census.order('datetime DESC, created_at DESC').where(
      shelter_building_id: params[:building],
      shelter_date: Date.strptime(params[:shelter_date], '%m/%d/%Y')
    ).where('created_at <= ?', as_of).first
    if @census
      render json: @census
    else
      render status: 404
    end
  end
end
