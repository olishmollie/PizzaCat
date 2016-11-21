class RatingsController < ApplicationController

  def new
  end

  def create
    user = User.find(session[:user_id])
    @rating = user.ratings.new(rating_params)
    @rating.user_id = user.id
    if @rating.save
      redirect_to user_rating_path(user.id, @rating.id)
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
      params.require(:rating).permit(:restaurant_id, :stars, :notes)
    end
end
