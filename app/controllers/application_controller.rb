class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # 執行 authenticate_user 驗證
  before_action :authenticate_user!

end
