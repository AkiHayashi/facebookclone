class SessionsController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]
  def new
  end
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user = User.find_by(email: params[:session][:email].downcase)
      session[:user_id] = user.id
      redirect_to user_path(user.id)
    else
      flash.now[:danger] = 'Failed to log in.'
      render :new
    end
  end
  def destroy
    session.delete(:user_id)
    flash[:notice] = 'Logged out'
    redirect_to new_session_path
  end
end
