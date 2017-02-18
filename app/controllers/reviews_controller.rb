class ReviewsController < ApplicationController
  before_filter :authorize
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

  def destroy
    @product = Product.find(params[:product_id])
    @review = @product.reviews.find(params[:id])
    @review.destroy

    redirect_to @review.product
  end

  private
    def review_params
      params.require(:review).permit(:description, :rating)
    end
end