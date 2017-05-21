#
# Controller for maintaining shelter census records
#
class CensusesController < ApplicationController
  def show
    @censuses = Census.order('datetime DESC, created_at DESC')
    census_params.each do |key, value|
      @censuses = @censuses.public_send(key, value) if value.present?
    end
    render json: @censuses
  end

  private

  def census_params
    params.permit(:building, :shelter_date, :author, :as_of)
  end
end
