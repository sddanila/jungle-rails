require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'After creation' do
    before :each do
      # Setup category for products
      @category = Category.new(name: 'Toys')
      # Setup at least two products with different quantities, names, etc
      @product1 = Product.create!(name: 'Toddler Cell Phone', price: 20, quantity: 30, category: @category)
      @product2 = Product.create!(name: 'Toddler Motorbike', price: 40, quantity: 20, category: @category)
      # Setup at least one product that will NOT be in the order
      @product3 = Product.create!(name: 'Fluffy Moose', price: 5, quantity: 50, category: @category)
    end
    # pending test 1
    it 'deducts quantity from products based on their line item quantities' do
      # TODO: Implement based on hints below
      # 1. initialize order with necessary fields (see orders_controllers, schema and model definition for what is required)
      @order = Order.new(total_cents: 20000, email: 'mazli@mazli.com', stripe_charge_id: 'id123')
      # 2. build line items on @order
      @order.line_items.new(
        product: @product1,
        quantity: 2,
        item_price: @product1.price_cents,
        total_price: @product1.price
      )
      @order.line_items.new(
        product: @product2,
        quantity: 4,
        item_price: @product2.price_cents,
        total_price: @product2.price
      )
      # 3. save! the order - ie raise an exception if it fails (not expected)
      @order.save!
      # 4. reload products to have their updated quantities
      @product1.reload
      @product2.reload
      # 5. use RSpec expect syntax to assert their new quantity values
      Product.update_product_quantity(@product1, 2)
      expect(@product1.quantity).to eq(28)
      # it 'should show product2 quantity to be 16 after placing order' do
      #   quantity = @product2.update_product_quantity(@product2, 4)
      #   expect(@product2.quantity).to eq(16)
      # end
    end
    # pending test 2
    xit 'does not deduct quantity from products that are not in the order' do
      # TODO: Implement based on hints in previous test
    end
  end
end
