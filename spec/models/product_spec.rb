require 'rails_helper'

# RSpec.describe Product, type: :model do
#   describe 'Validations' do
#     before :each do
#       @category = Category.create(name: "Electronics")
#     end

#     it 'is valid with correct attributes' do
#       product = Product.new(name: "Awesome, Massive TV", price_cents: 10000, quantity: 21, category: @category)
#       expect(product).to be_valid
#     end

#     it 'is not valid without a name' do
#       product = Product.new(price_cents: 10000, quantity: 21, category: @category)
#       expect(product).to_not be_valid
#       expect(product.errors.full_messages).to include("Name can't be blank")
#     end

#     it 'is not valid without a price_cents' do
#       product = Product.new(name: "Awesome, Massive TV", quantity: 21, category: @category)
#       expect(product).to_not be_valid
#       expect(product.errors.full_messages).to include("Price can't be blank")
#     end

#     it 'is not valid without a quantity' do
#       product = Product.new(name: "Awesome, Massive TV", price_cents: 10000, category: @category)
#       expect(product).to_not be_valid
#       expect(product.errors.full_messages).to include("Quantity can't be blank")
#     end

#     it 'is not valid without a category' do
#       product = Product.new(name: "Awesome, Massive TV", price_cents: 10000, quantity: 21)
#       expect(product).to_not be_valid
#       expect(product.errors.full_messages).to include("Category can't be blank")
#     end
#   end
# end