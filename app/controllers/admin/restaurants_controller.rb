class Admin::RestaurantsController < ApplicationController
  # 後台權限驗證
  before_action :authenticate_admin
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    # 由於是全部 (多筆) 餐廳資料，所以實例變數 ＠restaurants 使用複數。
    # 用 Restaurant.all 撈出所有的餐廳資料並存入 @restaurants 這個實例變數。
    # 搭配kaminari 產生分頁功能
    @restaurants = Restaurant.page(params[:page]).per(10)
  end
  
  # 沒有增加這一段會造成 new頁面出現 error is nil 
  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      flash[:notice] = "restaurant was successfully created"
      redirect_to admin_restaurants_path
    else
      flash.now[:alert] = "restaurant was failed to create"
      render :new
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    if @restaurant.update(restaurant_params)
      redirect_to admin_restaurant_path(@restaurant)
      flash[:notice] = "restaurant was successfully updated"
    else
      render :edit
      flash[:alert] = "restaurant was failed to update"
    end
  end

  def destroy
    @restaurant.destroy
    redirect_to admin_restaurants_path
    flash[:alert] = "restaurant was deleted"
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :opening_hours, :tel, :address, :description, :image, :category_id)
  end

end
