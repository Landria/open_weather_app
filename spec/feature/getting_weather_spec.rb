require 'rails_helper'

describe 'Getting weather', type: :feature, js: true do
  before do
    visit '/'
    expect(page).to have_content('Open Weather App')
  end

  it 'shows error when no data given' do
    fill_in 'country', with: 'Germany'
    click_button('Submit')
    expect(page).to have_content('Please enter country and city')
  end

  it 'shows the weather for a given city and country' do
    fill_in 'Country', with: 'Germany'
    fill_in 'City', with: 'Berlin'
    click_button('Submit')
    expect(page).to have_content('Weather for Berlin, Germany')
  end

  it 'shows the weather for a given city without (or wrong) country' do
    fill_in 'Country', with: 'Girmny'
    fill_in 'City', with: 'Berlin'
    click_button('Submit')
    expect(page).to have_content('Weather for Berlin')

    fill_in 'City', with: 'Berlin'
    click_button('Submit')
    expect(page).to have_content('Weather for Berlin')
  end
end
