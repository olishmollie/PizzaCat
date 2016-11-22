class RatingsController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create
    user = User.find(session[:user_id])
    restaurant = Restaurant.find(params[:restaurant_id])
    @rating = user.ratings.new(rating_params)
    @rating.restaurant_id = restaurant.id
    if @rating.save
      redirect_to user_ratings_path(user.id, @rating.id)
    else
      render plain: "Unable to save rating to database"
    end
  end

  def show
    @rating = Rating.find(params[:id])
  end

  def index
    @user = User.find(session[:user_id])
    @ratings = @user.ratings.all
  end

  private
    def rating_params
      params.require(:rating).permit(:stars, :notes)
    end
end
