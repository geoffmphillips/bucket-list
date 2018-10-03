class BoardItemsController < ApplicationController
  def index
    @user = current_user
    post = Post.find(board_items_params[:id])
    @boardItems = post.board_items.count
    @favorites_board = @user.boards.find_by(name: "Favorites")

    favorite = is_favorite?

    render json: { board_items: @boardItems, favorite: favorite }
  end

  private
    def board_items_params
      params.require(:board_items).permit!
    end

    def is_favorite?
      if @favorites_board
        return true
      else
        return false
      end
    end
end
