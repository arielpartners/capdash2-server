#
# Controller for maintaining shelter census records
#
class CensusesController < ApplicationController
  def show
    @censuses = Census.includes(:shelter_building)
                      .order('census_time DESC, created_at DESC')
    census_params.each do |key, value|
      @censuses = @censuses.public_send(key, value) if value.present?
    end
    render 'show'
  end

  private

  def census_params
    params.permit(:building, :shelter_date, :entered_by, :as_of)
  end
end
