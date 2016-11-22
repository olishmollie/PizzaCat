class RatingsController < ApplicationController
  before_filter :new, only: :create
  before_filter :edit, only: :update

  def new
    @user = User.find(params[:user_id])
    @restaurant = Restaurant.find(params[:restaurant_id])
    @rating = Rating.new
  end

  def create
    @rating = Rating.new(rating_params)
    @rating.user_id = @user.id
    @rating.restaurant_id = @restaurant.id
    if @rating.save
      redirect_to user_ratings_path(@user.id, @rating.id)
    else
      render plain: "Unable to save rating to database"
    end
  end

  def edit
    @rating = Rating.find(params[:id])
    @user = @rating.user
    @restaurant = @rating.restaurant
  end

  def update
    @rating.assign_attributes(rating_params)
    if @rating.save
      redirect_to user_ratings_path(@user.id, @rating.id)
    else
      render plain: "Unable to update rating in database"
    end
  end

  def destroy
    @rating = Rating.find(params[:id])
    @restaurant = @rating.restaurant
    if @rating.delete
      redirect_to restaurant_path(@restaurant.id)
    else
      render plain: "Unable to remove rating from database"
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
