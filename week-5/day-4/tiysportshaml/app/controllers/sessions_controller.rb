class SessionsController < ApplicationController

  # logging in
  def new
  end

  # handle the post from the login page
  def create
    # Extract the email and password from the params
    email = params[:email]
    password = params[:password]

    # Find the user by their email
    user = User.find_by(email: email)

    # If we found a user and their password checks out
    if user && user.authenticate(password)
      # Save the user_id in the session cookie
      session[:user_id] = user.id

      # logged in!
      redirect_to root_path
    else
      # Nope, something went wrong
      redirect_to login_path
    end
  end

  # logout
  def destroy
    # Remove their user_id from the session
    session[:user_id] = nil
    redirect_to root_path
  end
end
