class SessionsController < ApplicationController
  
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    # If the user exists AND the password entered is correct.
    if user && user.authenticate(params[:password])
      # Save the user id inside the browser cookie.
      return session[:user_id] = user.id
    else
      return false
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/sessions/new'
  end

end
