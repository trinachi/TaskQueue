class UsersController < ApplicationController
  before_filter :authenticate_user!
  
  def index
  end
  
  def show
    @user = User.find(params[:id])
  end

  def new
    @title = "Sign up"
  end
  
  def signin
    redirect_to signin_user_path, :action => "signin"
  end
end