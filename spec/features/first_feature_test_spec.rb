require 'rails_helper'

RSpec.feature "FirstFeatureTests", type: :feature, js: true do
  scenario "Passing test" do
    true.should be true
  end
end
