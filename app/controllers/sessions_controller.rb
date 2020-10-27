class SessionsController < ApplicationController
  skip_before_action :authenticate_user!

  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      session[:email] = user.email
      redirect_to cookies[:original_request_path] || root_path
    else
      flash.now[:alert] = 'Invalid email or password'
      render :new
    end
  end

  def exit
    @current_user = nil
    reset_session
    redirect_to root_path
  end
end
