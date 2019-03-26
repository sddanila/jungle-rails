require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
    # SETUP
    before :each do
      @category = Category.create! name: 'Apparel'
  
      10.times do |n|
        @category.products.create!(
          name: Faker::Hipster.sentence(3),
          description: Faker::Hipster.paragraph(4),
          quantity: 10, 
          price: 64.99,
          image: open_asset('apparel1.jpg')
        )
      end
    end
  scenario "product number in cart increases when the user clicks on 'Add to Cart' button on home page" do
    # ACT
    visit root_path
    first(:button, 'Add').click

    # DEBUG
    save_screenshot

    # VERIFY
    navbar = find(:css, '.navbar')
    expect(navbar).to have_text 'My Cart (1)', count: 1
  end
end
