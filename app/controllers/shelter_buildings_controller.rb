class ShelterBuildingsController < ApplicationController
  def show
    slug = params[:id].parameterize
    building = ShelterBuilding.find_by(shelter_id: params[:shelter_id], slug: slug)
    if building
      view = {
        name: building.name,
        beds: building.bed_count(true),
        shelter: building.shelter.name,
        units: building.places.count
      }
      render json: view
    else
      render status: 404
    end
  end

  def index
    @shelter_buildings = ShelterBuilding.includes(:address)
    render json: @shelter_buildings
  end
end
