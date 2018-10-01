class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :update, :destroy]

  # GET /locations
  def index
    @locations = Location.all
    @locationPosts = []
    @locations.each do |location|
      @locationPosts << location.posts.first
    end

    render json: {
      locations: @locations,
      locationPosts: @locationPosts
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
