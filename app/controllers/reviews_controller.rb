class ReviewsController < ApplicationController
  before_filter :check_logged_in
  
  def create
    @review = Review.new(allowed_params)
    @review.user_id = current_user.id
    @review.save!
    @product = Product.find(params[:product_id])
    redirect_to @product
  end

  def destroy
    review = Review.find(params[:id])
    @product = Product.find(params[:product_id])
    review.destroy!
    redirect_to @product
  end

  def check_logged_in
    if !current_user
      redirect_to login_path
    end
  end

  private
    def allowed_params
      params.require(:review).permit(:rating, :description, :product_id, :user_id)
    end
end
