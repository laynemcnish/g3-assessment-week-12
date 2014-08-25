require 'rails_helper'
require 'capybara/rails'
require 'spec_helper'

feature 'Home Page' do

  scenario 'User can view homepage' do
    visit root_path
    expect(page).to have_content("Cageflix")
    expect(page).to have_content("Netflix for Nic Cage movies")
  end
end

