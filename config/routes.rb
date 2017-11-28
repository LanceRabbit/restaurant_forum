Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # 前台
  root "restaurants#index"
  
  # 後台
  # url path for admin 
  namespace :admin do
    root "restaurants#index"
  end
end
