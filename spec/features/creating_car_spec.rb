require 'rails_helper'

feature 'Create a car' do
  scenario 'can create a car' do
    visit root_path
    click_link 'New Car'

    car = FactoryGirl.create(:car)
    car2 = FactoryGirl.create(:car)

    fill_in 'Make', with: car.make
    fill_in 'Model', with: car.model
    fill_in 'Year', with: car.year
    fill_in 'Price', with: car.price


    click_button 'Submit'

    visit root_path
    click_link 'New Car'

    fill_in 'Make', with: car2.make
    fill_in 'Model', with: car2.model
    fill_in 'Year', with: car2.year
    fill_in 'Price', with: car2.price

    click_button 'Submit'

    visit root_path
    expect(page).to have_content("#{car.year} #{car.make} #{car.model} #{car.price}")
    expect(page).to have_content("#{car2.year} #{car2.make} #{car2.model} #{car2.price}")
  end
end
