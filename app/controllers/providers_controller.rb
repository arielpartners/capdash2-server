#
# Controller for maintaining provider information
#
class ProvidersController < ApplicationController
  def index
    @providers = Provider.all
    render json: @providers
  end

  def show
    slug = params[:id].parameterize
    @provider = Provider.find_by(slug: slug)
    if @provider
      render json: @provider
    else
      head :not_found
    end
  end
end
