class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]

  # GET /posts
  def index
    @posts = Post.all
    @categories = Category.all
    @boards = Board.all

    render json: { posts: @posts, categories: @categories }
  end

  # GET /posts/1
  def show
    categories = @post.categories.order(:name)
    location = @post.location
    render json: { post: @post, categories: categories, location: location }
  end

  # POST /posts
  def create
    @location = params[:location]
    @post = params[:post]
    @categories = params[:categories]
    @boards = params[:boards]

    pp @post
    pp @location
    pp @categories
    pp @boards

    if @post.save
      render json: @post, status: :created, location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def post_params
      params.require(:post).permit(:post, :boards, :location, :categories, :title, :note, :lat, :long, :user_id, :photo_url, :city)
    end
end
