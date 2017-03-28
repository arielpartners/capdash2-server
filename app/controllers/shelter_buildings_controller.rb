class ShelterBuildingsController < ApplicationController
  def show
    building = ShelterBuilding.find_by(shelter_id: params[:shelter_id], slug: params[:id])
    if building
      view = {
        name: building.name,
        beds: building.bed_count(true),
        shelter: building.shelter.name,
        units: building.units.count
      }
      render json: view
    else
      render status: 404
    end
  end
end
