class BoardItemsController < ApplicationController
  def show
    @user = current_user
    @post = Post.find(board_items_params[:id])
    count = @post.board_items.count
    favorite = false

    if @user
      favorites_board = @user.boards.find_by(name: "Favorites")
      favorite = favorites_board.posts.exists?(@post[:id])
    end

    render json: { count: count, favorite: favorite }
  end

  def update
    @user = current_user
    @post = Post.find(board_items_params[:id])

    favorite = false

    if @user
      favorites_board = @user.boards.find_by(name: "Favorites")
      match = favorites_board.posts.exists?(@post[:id])
      boards = @post.boards.where(user_id: @user[:id])

      if match
        BoardItem.where(post_id: @post[:id]).where(board_id: favorites_board[:id]).delete_all
      else
        BoardItem.create!(post_id: @post[:id], board_id: favorites_board[:id])
        favorite = true
      end
    end

    count = @post.board_items.count

    render json: { favorite: favorite, count: count, boards: boards }
  end

  private
    def board_items_params
      params.permit!
    end
end
