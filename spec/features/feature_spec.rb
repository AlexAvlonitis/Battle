require 'spec_helper'

feature 'Enter names' do
  scenario 'submitting names' do
    sign_in_and_play
    expect(page).to have_content('Alex vs Bob')
  end
end

feature 'View Hit points' do
  scenario 'viewing player hit points' do
    sign_in_and_play
    expect(find('progress')['max']).to eq('100')
  end
end

feature 'Attack' do
  scenario 'attacking player 2' do
    sign_in_and_play
    click_button("attack")
    expect(page).to have_content("Player 2 is under attack")
  end

  scenario 'reduce HP' do
    sign_in_and_play
    click_button("attack")
    visit("http://localhost:4567/play")
    expect(find('progress')['value']).to eq('80')
  end
end
