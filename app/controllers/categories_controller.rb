class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :update, :destroy]

  # GET /categories
  def index
    @categories = Category.all
    @categoryPosts = []
    @categories.each do |category|
      @categoryPosts << category.posts.first
    end

    @categoryPosts = Post.joins(post_categories: :category).where(categories: { id: 1})

    render json: {
      categories: @categories,
      categoryPosts: @categoryPosts,
    }
  end

  # GET /categories/1
  def show
    @category = Category.find(params[:id])
    @posts = Post.joins(post_categories: :category).where(categories: {id: params[:id]})
    render json: { posts: @posts, category: @category}
  end

  # POST /categories
  def create
    @category = Category.new(category_params)

    if @category.save
      render json: @category, status: :created, location: @category
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def category_params
      params.require(:category).permit(:id, :name)
    end
end
