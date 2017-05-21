#
# Controller for maintaining information about shelter utilization
#
class UtilizationController < ApplicationController
  def show
    results = UtilizationService.averages(utilization_params)
    render json: results
  end

  private

  def utilization_params
    params.permit(:group_by, :period_type, :period_ending)
  end
end
