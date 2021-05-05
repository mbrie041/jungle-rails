require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end


  #Testing that the user can navigated from the home page to the product detail page by clicking a product
    #Generate the root page
    #click the first product 
    #screenshot the page to see what we get
  scenario "User can navigate from the home page to the product details page by clicking a products" do
    # ACT
    visit root_path
    click_on "Details"
    # DEBUG
    sleep 1
    save_screenshot

    expect(page).to have_css '.products-show'
  end
end
