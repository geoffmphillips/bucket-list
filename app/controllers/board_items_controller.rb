class BoardItemsController < ApplicationController
  def show
    @user = current_user
    post = Post.find(board_items_params[:id])
    count = post.board_items.count
    favorite = false

    if @user
      @favorites_board = @user.boards.find_by(name: "Favorites")
      favorite = is_favorite?
    end

    render json: { count: count, favorite: favorite }
  end

  def create
    @user = current_user
  end

  private
    def board_items_params
      params.permit!
    end

    def is_favorite?
      if @favorites_board
        return true
      else
        return false
      end
    end
end
