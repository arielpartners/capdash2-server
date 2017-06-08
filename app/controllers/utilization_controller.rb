#
# Controller for maintaining information about shelter utilization
#
class UtilizationController < ApplicationController
  def show
    if params[:group_by] == 'shelter'
      results = ShelterUtilization.for_all_buildings
      render json: results
    elsif params[:group_by] == 'case-type'
      results = ShelterUtilization.for_all_case_types
      render json: results
    else
      render json: { error: 'Invalid group_by parameter' }, status: 400
    end
  end

  private

  def utilization_params
    params.permit(:group_by)
  end
end
