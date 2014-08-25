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
    expect(page).to have_content("Year is not a number")
    expect(page).to have_content("Synopsis can't be blank")
  end

  scenario "user must add an integer in the year field" do
    user_views_new_movie_page
    fill_in 'Name', with: 'Face/Off'
    fill_in 'Year', with: 'blah'
    fill_in 'Synopsis', with: 'To foil an extortion plot, an FBI agent undergoes a face-transplant surgery and assumes the identity and physical appearance of a ruthless terrorist, but the plan backfires when the same criminal impersonates the cop with the same method.'
    click_button 'Create Movie'
    expect(page).to have_content("Year is not a number")
  end

  scenario "movies are displayed in chronological order" do
    user_views_new_movie_page
    user_adds_new_movie
    user_adds_other_movies
    expect(page).to have_selector("ul.movies li:nth-child(1)", :text => "The Bad Lieutenant: Port of Call - New Orleans")
    expect(page).to have_selector("ul.movies li:nth-child(2)", :text => "Face/Off")
    expect(page).to have_selector("ul.movies li:nth-child(3)", :text => "Leaving Las Vegas")
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

def user_adds_other_movies
  user_views_new_movie_page
  fill_in 'Name', with: 'The Bad Lieutenant: Port of Call - New Orleans'
  fill_in 'Year', with: '2009'
  fill_in 'Synopsis', with: 'Terence McDonagh is a drug- and gambling-addled detective in post-Katrina New Orleans investigating the killing of five Senegalese immigrants.'
  click_button 'Create Movie'
  user_views_new_movie_page
  fill_in 'Name', with: 'Leaving Las Vegas'
  fill_in 'Year', with: '1995'
  fill_in 'Synopsis', with: 'Ben Sanderson, an alcoholic Hollywood screenwriter who lost everything because of his drinking, arrives in Las Vegas to drink himself to death. There, he meets and forms an uneasy friendship and non-interference pact with prostitute Sera.'
  click_button 'Create Movie'
end