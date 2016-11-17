class RestaurantsController < ApplicationController
  
  before_filter :authorize

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new[restaurant_params]
    @user.save
    redirect_to @user
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def index
    @restaurant = Restaurant.all
  end

  private
    def restaurant_params
      params.require(:restaurant).permit(:name, :city, :state)
    end
end
