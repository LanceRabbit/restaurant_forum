class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update]
  
    def index
      @users = User.all
    end

    def show
      # 不重複出現已評論餐廳
      # 需同步調整user.rb的設定
      @commented_restaurants = @user.commented_restaurants.uniq
    end
  
    def edit
      unless @user == current_user
        redirect_to user_path(@user)
      end
    end
  
    def update
      @user.update(user_params)
      redirect_to user_path(@user)
    end
  
    private
  
    def set_user
      @user = User.find(params[:id])
    end
  
    def user_params
      params.require(:user).permit(:name, :intro, :avatar)
    end
end