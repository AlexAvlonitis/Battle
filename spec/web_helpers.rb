def sign_in_and_play
  visit('localhost:4567')
  fill_in('player1', with: 'Alex')
  fill_in('player2', with: 'Bob')
  click_button("submit")
end
