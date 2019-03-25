require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    
    before(:all) do
      @category = Category.new(name: 'Toys')
      @product = Product.new(name: 'Toddler Cell Phone', price: 8, quantity: 36, category: @category)
    end

    it 'validates product is valid when all 4 fields are filled in' do
      # @category = Category.new(id: 1, name: 'Toys')
      # @product = Product.new(name: 'Toddler Cell Phone', price: 10, quantity: 36, category: @category)
      expect(@product).to be_valid
    end

    it 'validates the presence of name' do
      # @category = Category.new(id: 1, name: 'Toys')
      # @product = Product.new(name: nil, price: 8, quantity: 36, category: @category)
      @product.name = nil
      expect(@product).to_not be_valid
      expect(@product.errors[:name].size).to eq(1)
    end

    it 'validates the presence of price' do
      # @category = Category.new(id: 1, name: 'Toys')
      # @product = Product.new(name: 'Toddler Cell Phone', price: nil, quantity: 36, category: @category)
      @product.price_cents = nil
      expect(@product).to_not be_valid
      expect(@product.errors[:price_cents].size).to eq(1)
    end

    it 'validates the presence of quantity' do
      # @category = Category.new(id: 1, name: 'Toys')
      # @product = Product.new(name: 'Toddler Cell Phone', price: 10, quantity: nil, category: @category)
      @product.quantity = nil
      expect(@product).to_not be_valid
      expect(@product.errors[:quantity].size).to eq(1)
    end

    it 'validates the presence of category' do
      # @category = Category.new(id: 1, name: 'Toys')
      # @product = Product.new(name: 'Toddler Cell Phone', price: 10, quantity: 36, category: nil)
      @product.category = nil
      expect(@product).to_not be_valid
      expect(@product.errors[:category].size).to eq(1)
    end
  end
end
