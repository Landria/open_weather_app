require 'rails_helper'

describe 'Getting weather', type: :feature, js: true do
  it 'shows the weather for a given city' do
    visit '/'
    expect(page).to have_content('Open Weather App')

    fill_in 'country', with: 'Germany'
    click_button('Submit')
    expect(page).to have_content('Please enter country and city')

    fill_in 'Country', with: 'Germany'
    fill_in 'City', with: 'Berlin'
    click_button('Submit')
    expect(page).to have_content('Weather for Germany, Berlin')
  end
end
