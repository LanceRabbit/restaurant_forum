class RestaurantsController < ApplicationController
  # 執行 authenticate_user 驗證
  before_action :authenticate_user!

  def index
  end
end
