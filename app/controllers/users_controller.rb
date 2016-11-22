class UsersController < ApplicationController
  skip_before_action :authorize, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_restaurants_path(@user.id)
    else
      render plain: "Unable to save user to db"
    end
  end

  def show
    @user = User.find(params[:id])
    @restaurants = Restaurant.all
  end

  def index
    @users = User.all
  end

  private
    def user_params
      params.require(:user).permit(:username, :password, :email)
    end
end
