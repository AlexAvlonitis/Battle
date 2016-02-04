require 'sinatra/base'
require_relative './lib/player'
require_relative './lib/game'

class Battle < Sinatra::Application
  enable :sessions
  set :public_folder, 'static'

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
    @current_player = $game.cp
    @player1 = $game.player1
    @player2 = $game.player2
    erb(:play)
  end

  get '/attack' do
    @current_player = $game.cp
    $game.attack
    @player1 = $game.player1
    @player2 = $game.player2
    erb :attack
  end

  get '/paralyze' do
    @current_player = $game.cp
    $game.paralyze
    @player1 = $game.player1
    @player2 = $game.player2
    erb :paralyze
  end

  run! if app_file == $0
end
