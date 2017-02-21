require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before(:each) do
      @product = Product.new()
      @product.name = "shirt"
      @product.price = 18
      @product.quantity = 38

      @category = Category.new()
      @category.name = "Pop"
      @product.category = @category
    end

    it "test product should be valid" do
      expect(@product).to be_valid
    end

    it "product name must be present" do
      @product.name = nil
      @product.save
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it "product price must be present" do
      @product.price_cents = nil
      @product.save
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it "product quantity must be present" do
      @product.quantity = nil
      @product.save
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it "product category must be present" do
      @product.category = nil
      @product.save
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
