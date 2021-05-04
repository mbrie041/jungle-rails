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

    it "Should have a name." do
      @category = Category.new
      @category.id = 123
      @category.name = "new products"
      @product = Product.new
      @product.name = nil
      @product.price = 5000
      @product.quantity = 10
      @product.category_id = @category
      @product.save
      @category.products = [@product]
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages[0]).to eql("Name can't be blank")
    end

    it "Should have a Price." do
      @category = Category.new
      @category.id = 123
      @category.name = "new products"
      @product = Product.new
      @product.name = "Game"
      @product.price = nil
      @product.quantity = 10
      @product.category_id = @category
      @product.save
      @category.products = [@product]
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages[0]).to eql("Price cents is not a number")
    end

    it "Should have a Quantity." do
      @category = Category.new
      @category.id = 123
      @category.name = "new products"
      @product = Product.new
      @product.name = "Game"
      @product.price = 5000
      @product.quantity = nil
      @product.category_id = @category
      @product.save
      @category.products = [@product]
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages[0]).to eql("Quantity can't be blank")
    end

    it "Should have a Category." do
      @category = nil
      @product = Product.new
      @product.name = "Game"
      @product.price = 5000
      @product.quantity = 10
      @product.category_id = @category
      @product.save
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages[0]).to eql("Category can't be blank")
    end
  end
end