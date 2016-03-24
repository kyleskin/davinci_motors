require 'rails_helper'

feature 'Deleting a car' do
  scenario 'delete a car' do
    FactoryGirl.create(:car)

    visit root_path


    click_link 'destroy_car_1'
    # save_and_open_page


  end
end
