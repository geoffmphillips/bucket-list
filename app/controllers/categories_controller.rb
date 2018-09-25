class CategoriesController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]

  # GET /categories
  def index
    @categories = Category.all
    @category1Posts = Post.joins(post_categories: :category).where(categories: { id: 1})
    @category2Posts = Post.joins(post_categories: :category).where(categories: { id: 2})
    @category3Posts = Post.joins(post_categories: :category).where(categories: { id: 3})
    @category4Posts = Post.joins(post_categories: :category).where(categories: { id: 4})
    @category5Posts = Post.joins(post_categories: :category).where(categories: { id: 5})
    @category6Posts = Post.joins(post_categories: :category).where(categories: { id: 6})
    @category7Posts = Post.joins(post_categories: :category).where(categories: { id: 7})

    render json: {
      categories: @categories,
      category1Posts: @category1Posts,
      category2Posts: @category2Posts,
      category3Posts: @category3Posts,
      category4Posts: @category4Posts,
      category5Posts: @category5Posts,
      category6Posts: @category6Posts,
      category7Posts: @category7Posts,
    }
  end

  # GET /categories/1
  def show
    categories = @category.categories
    render json: { category: @category, categories: categories }
  end

  # POST /categories
  def create
    @category = Category.new(post_params)

    if @category.save
      render json: @category, status: :created, location: @category
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /categories/1
  def update
    if @category.update(post_params)
      render json: @category
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  # DELETE /categories/1
  def destroy
    @category.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @category = Category.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def post_params
      params.require(:category).permit(:name)
    end
end