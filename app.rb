require 'sinatra/base'
require_relative './lib/player'
require_relative './lib/game'

class Battle < Sinatra::Application
  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/names' do
    player1 = Player.new(params[:player1])
    player2 = Player.new(params[:player2])
    $game = Game.new(player1, player2)
    redirect '/play'
  end

  get '/play' do
    @hp = $game.player2.hp
    @player1 = $game.player1.name
    @player2 = $game.player2.name
    erb(:play)
  end

  post '/attack' do
    redirect '/attack'
  end

  get '/attack' do
    $game.attack($game.player2)
    erb :attack
  end

  run! if app_file == $0
end
