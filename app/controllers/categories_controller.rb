class CategoriesController < ApplicationController

  def index
    @Categories = Category.all.order(created_at: :desc)
  end

  def show
    @category = Category.find params[:id]
  end


end
