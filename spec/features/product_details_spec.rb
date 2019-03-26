require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
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
  scenario "navigates from the home page to the product detail page by clicking on a product" do
    # ACT
    visit root_path
    first(:link, 'Details').click

    # DEBUG
    save_screenshot

    # VERIFY
    expect(page).to have_css 'section.products-show', count: 1
  end
end
