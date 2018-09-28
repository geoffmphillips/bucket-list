class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :update, :destroy]

  # GET /locations
  def index
    @locations = Location.all
    @location1Posts = Location.find(1).posts
    @location2Posts = Location.find(2).posts
    @location3Posts = Location.find(3).posts
    @location4Posts = Location.find(4).posts
    @location5Posts = Location.find(5).posts

    render json: {
      locations: @locations,
      location1Posts: @location1Posts,
      location2Posts: @location2Posts,
      location3Posts: @location3Posts,
      location4Posts: @location4Posts,
      location5Posts: @location5Posts,
    }
  end

  # GET /locations/1
  def show
    @location = Location.find(params[:id])
    @posts = @location.posts
    render json: { posts: @posts, location: @location}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      @location = Location.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def location_params
      params.require(:location).permit(:id, :city, :location, :lat, :long, :google_id)
    end
end
