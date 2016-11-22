class RestaurantsController < ApplicationController
  def new
    @restaurant = Restaurant.new
  end

  def create
  end

  def show
    @user = @current_user if @current_user
    @restaurant = Restaurant.find(params[:id])
    @ratings = @restaurant.ratings.all
    @rating = @ratings.find_by(user_id: @user.id) if @user
  end

  def index
    @user = User.find(session[:user_id]) if session[:user_id]
    @restaurants = Restaurant.all
  end

  private
    def restaurant_params
      params.require(:restaurant).permit(:name, :city, :state)
    end
end
