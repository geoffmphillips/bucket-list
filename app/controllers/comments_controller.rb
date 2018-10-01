class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :update, :destroy]

  # GET /comments/1
  def show
    @comment = Comment.find(params[:id])
    @user = @comment.user
    render json: { user: @user, comment: @comment}
  end

  # POST /comments
  def create
    @comment = Comment.new(comment_params)
    @user = current_user
    @comment[:user_id] = @user.id

    if @comment.save
      render json: @comment, status: :created, comment: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /comments/1
  def destroy
    @comment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def comment_params
      params.require(:comment).permit(:text, :post_id, :user_id)
    end
end
