class UtilizationController < ApplicationController
  def show
    results = UtilizationService.averages
    render json: results
  end
end
