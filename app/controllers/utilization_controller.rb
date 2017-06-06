#
# Controller for maintaining information about shelter utilization
#
class UtilizationController < ApplicationController
  def show
    utilization = Utilization.new(utilization_params)
    results = utilization.calculate
    render json: results
  end

  private

  def utilization_params
    params.permit(:group_by)
  end
end
