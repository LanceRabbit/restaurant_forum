class RestaurantsController < ApplicationController
  # 執行 authenticate_user 驗證
  before_action :authenticate_user!
  before_action :set_restaurant, only: [:show, :dashboard, :favorite, :unfavorite , :like, :unlike]


  def index
    @restaurants = Restaurant.page(params[:page]).per(6)
    @categories = Category.all     # 加上這一行
    
  end

  def show
    @comment = Comment.new    # 評論
  end

  # GET restaurants/feeds
  # 會去 render app/views/restuarants/feeds.html.erb
  def feeds
    @recent_restaurants = Restaurant.order(created_at: :desc).limit(10)
    @recent_comments = Comment.order(created_at: :desc).limit(10)
  end

  # GET restaurants/dashboard
  # 會去 render app/views/restuarants/dashboard.html.erb
  def dashboard

  end  

  def favorite
    @restaurant.favorites.create!(user: current_user)
    @restaurant.count_favorites
    redirect_back(fallback_location: root_path)  # 導回上一頁
  end

  def unfavorite
    favorites = Favorite.where(restaurant: @restaurant, user: current_user)
    favorites.destroy_all
    @restaurant.count_favorites
    redirect_back(fallback_location: root_path)
  end
  
  def like
    @restaurant.likes.create!(user: current_user)
    redirect_back(fallback_location: root_path)  # 導回上一頁
  end

  def unlike
    likes = Like.where(restaurant: @restaurant, user: current_user)
    likes.destroy_all
    redirect_back(fallback_location: root_path)
  end
  
  # GET /restaurants/ranking
  def ranking
    @restaurants = Restaurant.order(favorites_count: :desc).limit(10)
  end

  # 新增方法若需使用,記得新增在before_action
  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
