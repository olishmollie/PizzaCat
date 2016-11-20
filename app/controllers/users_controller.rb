class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_ratings_path(@user)
    else
      render plain: "Unable to save user to db"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  private
    def user_params
      params.require(:user).permit(:username, :password, :email)
    end
end
