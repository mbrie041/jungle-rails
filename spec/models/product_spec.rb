require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "A product with all 4 fields set will save successfully." do
      @category = Category.new
      @category.id = 123
      @category.name = "new products"
      @product = Product.new
      @product.name = "Game"
      @product.price = 5000
      @product.quantity = 10
      @product.category_id = @category
      @product.save
      @category.products = [@product]
      expect(@product).to be_valid
    end
  end
end