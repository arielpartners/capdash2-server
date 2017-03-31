class CensusesController < ApplicationController
  def utilization
    results = Census.utilization_averages
    render json: results
  end
end
