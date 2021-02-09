require 'rails_helper'

RSpec.feature "FirstFeatureTests", type: :feature, js: true do
  scenario "Passing test" do
    true.should be true
  end

  scenario "Failing test" do
    true.should be false
  end
end
