class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]

  # GET /posts
  def index
    @posts = Post.all
    @categories = Category.all
    @boards = Board.all
    @user = current_user

    render json: { posts: @posts, categories: @categories, boards: @boards, user: @user }
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
    @location = Location.find_or_create_by(post_params[:location].to_h)
    @post = Post.new(title: post_params[:title], note: post_params[:note], photo_url: post_params[:photo_url], user_id: post_params[:user_id], location_id: @location[:id])
    @categories = post_params[:categories]
    @boards = post_params[:boards]
    puts "=========== BOARDS ============="
    pp @boards

    if @post.save
      create_post_categories
      create_board_items

      render json: @post, status: :created, location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  private
    def create_post_categories
      @categories.each do |category|
        cat = Category.find_by(name: category)
        PostCategory.create!(post_id: @post[:id], category_id: cat[:id])
      end
    end

    def create_board_items
      @boards.each do |board|
        BoardItem.create!(post_id: @post[:id], board_id: board[:id], user_id: post_params[:user_id])
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def post_params
      params.require(:post).permit(
        :google_id,
        :title,
        :note,
        :lat,
        :long,
        :user_id,
        :photo_url,
        :city,
        boards: {},
        location: {},
        categories: [])
    end
end
