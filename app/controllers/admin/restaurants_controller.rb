class Admin::RestaurantsController < ApplicationController
  # 執行 authenticate_user 驗證
  before_action :authenticate_user!
  # 後台權限驗證
  before_action :authenticate_admin
  
  def index
    # 由於是全部 (多筆) 餐廳資料，所以實例變數 ＠restaurants 使用複數。
    # 用 Restaurant.all 撈出所有的餐廳資料並存入 @restaurants 這個實例變數。
    @restaurants = Restaurant.all
  end


end
