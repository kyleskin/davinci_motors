require 'rails_helper'

feature 'Editing a car' do
  scenario 'edit a car' do
    FactoryGirl.create(:car)

    visit root_path


    click_link 'edit_car_1'
    # save_and_open_page

    fill_in 'Make', with: 'Edited Car'

    click_button 'Submit'

    expect(page).to have_content 'Edited Car'

  end
end
