class SessionsController < ApplicationController
  def create
    @user = User.find_by email: params[:email]

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_back(fallback_location: root_path)
    else
      flash[:notice] = "Login failed. Wrong email or password."
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_back(fallback_location: root_path)
  end
end
