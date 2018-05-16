require 'rails_helper'

describe 'Getting weather', type: :feature, js: true do
  it 'shows the weather for a given city' do
    visit '/'
    expect(page).to have_content('Open Weather App')
  end
end
