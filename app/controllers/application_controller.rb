class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  # 執行 authenticate_user 驗證
  before_action :authenticate_user!

  protected
  # 參考 https://ihower.tw/rails/auth.html
  #增加客製化屬性name
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end
