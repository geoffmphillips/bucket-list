class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :update, :destroy]

  # GET /locations
  def index
    @locations = Location.all
    @location1Posts = Location.find(1).posts
    @location2Posts = Location.find(2).posts
    @location3Posts = Location.find(3).posts
    @location4Posts = Location.find(4).posts

    render json: {
      locations: @locations,
      location1Posts: @location1Posts,
      location2Posts: @location2Posts,
      location3Posts: @location3Posts,
      location4Posts: @location4Posts,
    }
  end

  # GET /locations/1
  def show
    @location = Location.find(params[:id])
    @posts = @location.posts
    render json: { posts: @posts, location: @location}
  end

  # POST /locations
  def create
    @location = Location.new(location_params)

    if @location.save
      render json: @location, status: :created, location: @location
    else
      render json: @location.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /locations/1
  def update
    if @location.update(location_params)
      render json: @location
    else
      render json: @location.errors, status: :unprocessable_entity
    end
  end

  # DELETE /locations/1
  def destroy
    @location.destroy
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
