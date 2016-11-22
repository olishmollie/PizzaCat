class RestaurantsController < ApplicationController
  def new
    @restaurant = Restaurant.new
  end

  def create
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @ratings = @restaurant.ratings.all
    @rating = @current_user.ratings.find_by(restaurant_id: @restaurant.id) if @current_user.has_reviewed?(@restaurant)
  end

  def index
    user = User.find(session[:user_id]) if session[:user_id]
    @restaurants = user.restaurants.all
  end

  private
    def restaurant_params
      params.require(:restaurant).permit(:name, :city, :state)
    end
end
