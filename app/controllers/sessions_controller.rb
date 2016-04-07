class SessionsController < ApplicationController
  def create
    @user = User.find_by(username: params[:session][:username])
    if @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash.now[:notice] = "Please enter valid username and password"
      render :new
    end
  end
end
