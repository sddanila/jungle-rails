class ReviewsController < ApplicationController
  
  def create
    @product = Product.find_by_id(params[:id])
    @reviews = Review.where(product_id: params[:id])
  end

end
