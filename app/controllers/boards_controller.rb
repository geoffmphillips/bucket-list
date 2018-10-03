class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :update, :destroy]

  # GET /boards
  def index
    @user = current_user

    @boards = @user.boards
    @boardposts = []
    @user.boards.each do |board|
      @boardposts << Post.joins(:boards).where(["board_items.board_id = ?", board.id]).first
    end

    render json: { posts: @boardposts, boards: @boards }
  end

  # GET /boards/1
  def show
    @board = Board.find(params[:id])
    @posts = Post.joins(:boards).where(["board_items.board_id = ?", @board.id])
    render json: { posts: @posts, board: @board }
  end

  # POST /boards
  def create
    @board = Board.new(name: board_params[:name], user_id: board_params[:user_id])

    if @board.save
      render json: @board, status: :created, location: @board
    else
      render json: @board.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /boards/1
  def update
    if @board.update(board_params)
      render json: @board
    else
      render json: @board.errors, status: :unprocessable_entity
    end
  end

  # DELETE /boards/1
  def destroy
    @board.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_board
      @board = Board.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def board_params
      params.require(:board).permit!
    end
end
