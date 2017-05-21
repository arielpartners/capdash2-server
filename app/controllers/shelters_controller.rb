#
# Controller for maintaining information about shelters
#
class SheltersController < ApplicationController
  def index
    if params[:provider]
      slug = params[:provider].parameterize
      @shelters = Shelter.joins(:provider).where(providers: { slug: slug })
    else
      @shelters = Shelter.all
    end
    render json: @shelters
  end
end
