class CategoriesController < ApplicationController

    def show
        @categories = Category.all
        @category = Category.find(params[:id])
        @restaurants = @category.restaurants.page(params[:page]).per(6)
    end
end
