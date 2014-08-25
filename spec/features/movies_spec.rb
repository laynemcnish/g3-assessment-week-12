require 'rails_helper'
require 'capybara/rails'
require 'spec_helper'

feature 'user add movies' do
  scenario "user can view new movie page" do
    user_views_new_movie_page
  end

  scenario "user can add new movie" do
    user_views_new_movie_page
    user_adds_new_movie
  end

  scenario "user must fill in all fields" do
    user_views_new_movie_page
    click_button "Create Movie"
    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Year can't be blank")
    expect(page).to have_content("Synopsis can't be blank")
  end
end


def user_views_new_movie_page
  visit root_path
  expect(page).to have_link("Add Movie")
  click_link("Add Movie")
  expect(page).to have_content("Name")
  expect(page).to have_content("Year")
  expect(page).to have_content("Synopsis")
end

def user_adds_new_movie
  fill_in 'Name', with: 'Face/Off'
  fill_in 'Year', with: '1997'
  fill_in 'Synopsis', with: 'To foil an extortion plot, an FBI agent undergoes a face-transplant surgery and assumes the identity and physical appearance of a ruthless terrorist, but the plan backfires when the same criminal impersonates the cop with the same method.'
  click_button 'Create Movie'
  expect(page).to have_content('Face/Off')
  expect(page).to have_content('1997')
  expect(page).to_not have_content("can't be blank")
end
