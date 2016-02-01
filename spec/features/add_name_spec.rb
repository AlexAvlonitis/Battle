require 'spec_helper'

feature 'Enter names' do
  scenario 'submitting names' do
    visit('localhost:4567')
    fill_in('player1', with: 'Alex')
    fill_in('player2', with: 'Bob')
    click_button("submit")
    expect(page).to have_content('Alex vs Bob')
  end
end
