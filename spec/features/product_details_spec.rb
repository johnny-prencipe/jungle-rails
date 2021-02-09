require 'rails_helper'

RSpec.feature "FirstFeatureTests", type: :feature, js: true do
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "Navigates to the product details page successfully" do
    visit root_path
    find('h4', match: :first).click
    save_screenshot
    expect(page).to have_css 'section.products-show'
  end
  
end
