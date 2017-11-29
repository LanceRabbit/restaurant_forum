class Admin::RestaurantsController < ApplicationController
  # 執行 authenticate_user 驗證
  before_action :authenticate_user!
  # 後台權限驗證
  before_action :authenticate_admin
  def index
  end


end
