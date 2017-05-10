class CensusesController < ApplicationController
  def utilization
    results = Census.utilization_averages
    render json: results
  end

  def show
    if params[:author]
      @censuses = Census.where(author: params[:author])
    else
      as_of = params[:as_of] || Date.today
      @censuses = Census.order('datetime DESC, created_at DESC').where(
        shelter_building_id: params[:building],
        shelter_date: Date.strptime(params[:shelter_date], '%m/%d/%Y')
      ).where('created_at <= ?', as_of)
    end
    render json: @censuses
  end
end
