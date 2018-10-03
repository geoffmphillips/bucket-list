class BoardItemsController < ApplicationController
  def index
    @user = current_user
    post = Post.find(board_items_params[:id])
    @boardItems = post.board_items.count

    render json: { board_items: @boardItems, boards: @boards }
  end

  private
    def board_items_params
      params.require(:board_items).permit!
    end
end
