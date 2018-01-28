Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # 前台
  # 只有顯示無其他功能, only, except皆可使用
  # 新增評論
  resources :restaurants, only: [:index, :show] do
    resources :comments, only: [:create, :destroy]
    
    # 瀏覽所有餐廳的最新動態
    # "Verb" "Action Name", :on => ":member or :collection"
    get :feeds, :on => :collection

    # 瀏覽個別餐廳的 Dashboard
    get :dashboard, :on => :member
    # 收藏餐廳
    post :favorite, :on => :member
    post :unfavorite, :on => :member
    # 按讚餐廳
    post :like, :on => :member
    post :unlike, :on => :member

  end
  
  # 個人資訊
  resources :users, only: [:show, :edit, :update]

  # resources :restaurants, except: [:new, :create, :edit, :update, :destroy]
  resources :categories, only: :show
  root "restaurants#index"

  # 後台
  # url path for admin 
  # 避免被猜出後台位置, 可修改名稱用path 替換 admin
  # namespace :admin , path: "nobody123know" do
  namespace :admin do
    resources :restaurants
    resources :categories 
    root "restaurants#index"
  end
end
