require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do

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

  #visit the home page and click 'Add to Cart' buttons for one of the products
    #Generate the root page
    #click the first product's add to cart
    #screenshot the page to see what we get
    #check to see if the text rendered in the top nav changes from "My Cart (0)" to to "My Cart (1)".
  scenario "Visit the home page and click 'Add to Cart' buttons for one of the products. My cart changes from 1 to 0." do
    visit root_path
    expect(page).to have_text 'My Cart (0)'
    save_screenshot
    click_on "Add"
    expect(page).to have_text 'My Cart (1)'
    sleep 1
    save_screenshot
  end  
end
