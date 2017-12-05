Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # 前台
  root "restaurants#index"
  
  # 後台
  # url path for admin 
  namespace :admin do
    resources :restaurants
    resources :categories 
    root "restaurants#index"
  end
end
