class LocationsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]

  # GET /locations
  def index
    @locations = location.all
    @location1Posts = Post.joins(post_locations: :location).where(locations: { id: 1})
    @location2Posts = Post.joins(post_locations: :location).where(locations: { id: 2})
    @location3Posts = Post.joins(post_locations: :location).where(locations: { id: 3})
    @location4Posts = Post.joins(post_locations: :location).where(locations: { id: 4})
    @location5Posts = Post.joins(post_locations: :location).where(locations: { id: 5})
    @location6Posts = Post.joins(post_locations: :location).where(locations: { id: 6})
    @location7Posts = Post.joins(post_locations: :location).where(locations: { id: 7})

    render json: {
      locations: @locations,
      location1Posts: @location1Posts,
      location2Posts: @location2Posts,
      location3Posts: @location3Posts,
      location4Posts: @location4Posts,
      location5Posts: @location5Posts,
      location6Posts: @location6Posts,
      location7Posts: @location7Posts,
    }
  end

  # GET /locations/1
  def show
    locations = @location.locations
    render json: { location: @location, locations: locations }
  end

  # POST /locations
  def create
    @location = location.new(post_params)

    if @location.save
      render json: @location, status: :created, location: @location
    else
      render json: @location.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /locations/1
  def update
    if @location.update(post_params)
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
    def set_post
      @location = location.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def post_params
      params.require(:location).permit(:name)
    end
end
