class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users/1
  def show
    token = extract_token(request)

    Authenticator.authenticated("test")    

    if !authenticated(token)
      # Render error page and return
    end

    @user = User.find params[:id]
    @boards = @user.boards.order(created_at: :desc)
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def extract_token(request)
    request.headers["Authorization"]
    # let token = 
    return token
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end
