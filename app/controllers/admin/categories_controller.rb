class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with username: ENV["ADMIN_USERNAME"], password: ENV["ADMIN_PASSWORD"]
  before_action :authenticate
  
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(
      :name
    )
  end

  private
  def authenticate
    http_basic_authenticate_with username: ENV["ADMIN_USERNAME"], password: ENV["ADMIN_PASSWORD"]
  end
end
