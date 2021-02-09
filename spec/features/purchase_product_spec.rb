require 'rails_helper'
# visit homepage
# find (first) product box
# click blue add button
# check nav to see if cart quantity has updated
# click on cart navigation 
# check if product is in the cart

RSpec.feature "PurchaseProducts", type: :feature, js: true do

  before :each do
    @category = Category.create! name: "test category"
    # name: "test category", category: @category
    @category.products.create!(
      name: "test product",
      description: "test description",
      image: "-",
      quantity: 5,
      price: 12.50
    )
  end

  scenario "An anonymous user purchases a product" do
    visit '/'
    page.save_screenshot()
    first('article').find_button('Add').click()
    find_link('My Cart (1)').click()
    assert page.has_content?('test product')
    assert page.has_content?('12.50')
  end

end
