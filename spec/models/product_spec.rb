require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it "creates a new category and saves it" do
      @category = Category.create(name: "Stationery")
      @product = Product.create(name: "a pen", price: 300, quantity: 5, category: @category)
      expect(@product).to be_present
    end

    it "throws error if name is missing" do
      @category = Category.create(name: "Stationery")
      @product = Product.create(price: 300, quantity: 5, category: @category)
      expect(@product.errors.full_messages).to include "Name can't be blank"
    end

    it "throws error if price is missing" do
      @category = Category.create(name: "Stationery")
      @product = Product.create(name: "a pen", quantity: 5, category: @category)
      expect(@product.errors.full_messages).to include "Price can't be blank"
    end

    it "throws error if quantity is missing" do
      @category = Category.create(name: "Stationery")
      @product = Product.create(name: "a pen", price: 300, category: @category)
      expect(@product.errors.full_messages).to include "Quantity can't be blank"
    end

    it "throws error if category is missing" do
      @category = Category.create(name: "Stationery")
      @product = Product.create(name: "a pen", price: 300, quantity: 5)
      expect(@product.errors.full_messages).to include "Category can't be blank"
    end

  end
end