class SessionsController < ApplicationController
  
  def new
  end

  def create
    if user = User.authenticate_with_credentials(params[:email],params[:password])
    # If the user exists AND the password entered is correct.
      # Save the user id inside the browser cookie. This is how we keep the user 
      # logged in when they navigate around our website.
      session[:email] = user.email
      session[:user_id] = user.id
      redirect_to root_url, notice: "Logged in!"
    else
    # If user's login doesn't work, send them back to the login form.
      render 'new'
    end
  end

  def destroy
    session[:email] = nil
    session[:user_id] = nil
    redirect_to '/sessions/new', notice: "Logged out!"
  end

end
