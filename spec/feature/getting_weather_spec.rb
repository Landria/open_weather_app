require 'rails_helper'

describe 'Getting weather', type: :feature, js: true do
  before do
    visit '/'
    expect(page).to have_content('Open Weather App')
  end

  it 'shows no error when firts time on a page' do
    expect(page).to_not have_content('Please enter country and city')
    expect(page).to_not have_content('Nothing to geocode')
    expect(page).to_not have_content('city not found')
    expect(page).to_not have_content('Weather for')
  end

  it 'shows weather for random point' do
    click_button('Random')
    expect(page).to_not have_content('Please enter country and city')
    expect(page).to have_content('Weather for')
    expect(page).to have_content('Visibility')
    expect(page).to have_content('Temperature')
  end

  it 'shows error when no data given' do
    click_button('Submit')
    expect(page).to have_content('Please enter country and city')
    expect(page).to_not have_content('Weather for')
  end

  it 'shows error when no city data given' do
    fill_in 'country', with: 'Germany'
    click_button('Submit')
    expect(page).to have_content('Please enter country and city')
    expect(page).to_not have_content('Weather for')
  end

  it 'shows the weather for a given city and country' do
    fill_in 'Country', with: 'Germany'
    fill_in 'City', with: 'Berlin'
    click_button('Submit')
    expect(page).to have_content('Weather for Berlin, Germany')
    expect(page).to have_content('Visibility')
    expect(page).to have_content('Temperature')
  end

  it 'shows the weather for a given city without (or wrong) country' do
    fill_in 'Country', with: 'Girmny'
    fill_in 'City', with: 'Berlin'
    click_button('Submit')
    expect(page).to have_content('Weather for Berlin')
    expect(page).to have_content('Humidity')
    expect(page).to have_content('Sunrise')

    fill_in 'City', with: 'Berlin'
    click_button('Submit')
    expect(page).to have_content('Weather for Berlin')
    expect(page).to have_content('Wind speed')
    expect(page).to have_content('Temperature min')
  end
end
