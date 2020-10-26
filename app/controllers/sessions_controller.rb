class SessionsController < ApplicationController
  skip_before_action :authenticate_user!

  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      session[:email] = user.email
      redirect_to cookies[:path]
    else
      render :new
    end
  end

  def exit
    @current_user = nil
    reset_session
    render :new
  end
end
