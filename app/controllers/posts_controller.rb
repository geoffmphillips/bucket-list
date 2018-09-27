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
    comments = @post.comments.order(created_at: :desc)

    render json: { post: @post, categories: categories, location: location, comments: comments }
  end

  # POST /posts
  def create
    @location = post_params[:location]
    @post = post_params[:post]
    @categories = post_params[:categories]
    @boards = post_params[:boards]
    @test = post_params[:test]

    puts "POST PARAMS ----"
    pp post_params

    puts "POST ----"
    pp @post
    puts "LOCATION ----"
    pp @location
    puts "CATEGORIES ----"
    pp @categories
    puts "BOARDS ----"
    pp @boards
    puts "TEST ----"
    pp @test

    if @post.save
      render json: @post, status: :created, location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def post_params
      params.require(:post).permit(:boards, :location, :categories, :title, :note, :lat, :long, :user_id, :photo_url, :city, :test)
    end
end
