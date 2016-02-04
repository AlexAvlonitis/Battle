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
    expect(page).to have_content("Bob is under attack")
  end

  scenario 'reduce HP player 2' do
    sign_in_and_play
    click_button("attack")
    visit("http://localhost:4567/play")
    expect(find('progress#p2')['value']).not_to eq 100
  end
end

feature 'Switch turns' do
  scenario 'attacking player 2 and then player 2 attacks p1' do
    sign_in_and_play
    click_button("attack")
    visit("http://localhost:4567/play")
    click_button("attack")
    expect(page).to have_content("Alex is under attack")
  end
end

feature 'Paralyze' do
  scenario 'when a user is paralyzed, there is a chance of losing his turn' do
    sign_in_and_play
    click_button("paralyze")
    visit("http://localhost:4567/play")
    click_button("attack")
    visit("http://localhost:4567/play")
    click_button("attack")
    expect(page).to have_content("Bob is under attack")
  end
end

feature 'Poison' do
  scenario 'when a user is poisoned, hp is reduced on his next attack' do
    sign_in_and_play
    click_button("poison")
    visit("http://localhost:4567/play")
    click_button("attack")
    visit("http://localhost:4567/play")
    expect(find('progress#p2')['value']).not_to eq 100
  end
end

# FEATURE TEST WHEN A USER LOSES
# feature 'Winning/losing' do
#   scenario 'P1 loses when reached 0HP' do
#     sign_in_and_play
#     while true
#       click_button("attack")
#       visit("http://localhost:4567/play")
#       break if ((find('progress#p2')['value']).match(/\-/))
#     end
#     expect(page).to have_content("Bob lost")
#   end
# end
