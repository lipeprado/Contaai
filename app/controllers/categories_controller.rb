class CategoriesController < ApplicationController

  def show
    #@category = Category.find(params[:id])
    @stories = Story.where(category_id: params[:id]).order(id: :desc)
  end
end
