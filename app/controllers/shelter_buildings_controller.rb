class ShelterBuildingsController < ApplicationController
  def show
    slug = params[:id].parameterize
    building = ShelterBuilding.find_by(shelter_id: params[:shelter_id], slug: slug)
    if building
      render json: building
    else
      render status: 404
    end
  end

  def index
    @shelter_buildings = ShelterBuilding.includes(:address)
    render json: @shelter_buildings
  end
end
