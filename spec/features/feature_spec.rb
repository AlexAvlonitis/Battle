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
    expect(find('progress#p2')['max']).to eq('100')
  end
end

feature 'Attack' do
  scenario 'attacking player 2' do
    sign_in_and_play
    click_button("attack")
    expect(page).to have_content("Player 2 is under attack")
  end

  scenario 'reduce HP player 2' do
    sign_in_and_play
    click_button("attack")
    visit("http://localhost:4567/play")
    expect(find('progress#p2')['value']).to eq('90')
  end
end

feature 'Switch turns' do
  scenario 'attacking player 2 and then player 2 attacks p1' do
    sign_in_and_play
    click_button("attack")
    visit("http://localhost:4567/play")
    click_button("attack")
    expect(page).to have_content("Player 1 is under attack")
  end
end

feature 'Winning/losing' do
  scenario 'P1 loses when reached 0HP' do
    sign_in_and_play
    19.times do
      click_button("attack")
      visit("http://localhost:4567/play")
    end
    click_button("attack")
    expect(page).to have_content("Player 1 lost")
  end
end
