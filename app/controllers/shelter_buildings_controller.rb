#
# Controller for maintaining information about shelter buildings
#
class ShelterBuildingsController < ApplicationController
  def show
    slug = params[:id].parameterize
    @shelter_building = ShelterBuilding.find_by(shelter_id: params[:shelter_id],
                                                slug: slug)
    if @shelter_building
      render 'show'
    else
      head :not_found
    end
  end

  def index
    @shelter_buildings = ShelterBuilding.includes(:address, :floors, :places)
    render 'index'
  end
end
