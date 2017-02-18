class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
    @reviews = Review.all.order(created_at: :desc) # ???
  end

  def show
    @product = Product.find params[:id]
    # @user = User.find params[:id]
    @review =Review.new(:product=>@product) # ???
  end

end
