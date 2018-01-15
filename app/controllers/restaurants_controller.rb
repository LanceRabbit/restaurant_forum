class RestaurantsController < ApplicationController
  # 執行 authenticate_user 驗證
  before_action :authenticate_user!

  def index
    @restaurants = Restaurant.page(params[:page]).per(6)
    @categories = Category.all     # 加上這一行
    
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @comment = Comment.new    # 評論
  end

  # GET restaurants/feeds
  # 會去 render app/views/restuarants/feeds.html.erb
  def feeds
    @recent_restaurants = Restaurant.order(created_at: :desc).limit(10)
    @recent_comments = Comment.order(created_at: :desc).limit(10)
  end

end
