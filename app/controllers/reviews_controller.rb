class ReviewsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    # @review = @product.reviews.create(review_params)
    # redirect_to product_path(@product)
    @review = @product.reviews.new(review_params) # I need to know how this works???
    @review.user_id = current_user.id if current_user
    if @review.save!
      redirect_to @review.product
    else
      redirect :back
    end # ???

  end

  private
    def review_params
      params.require(:review).permit(:description, :rating)
    end
end