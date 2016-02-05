require 'sinatra/base'
require_relative './lib/player'
require_relative './lib/game'

class Battle < Sinatra::Application
  enable :sessions
  set :public_folder, File.dirname(__FILE__) + '/static'

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

  get '/poison' do
    @current_player = $game.cp
    $game.poison
    @player1 = $game.player1
    @player2 = $game.player2
    erb :poison
  end

  get '/sleep' do
    @current_player = $game.cp
    $game.sleeper
    @player1 = $game.player1
    @player2 = $game.player2
    erb :sleep
  end

  get '/heal' do
    @current_player = $game.cp
    $game.heal
    @player1 = $game.player1
    @player2 = $game.player2
    erb :heal
  end

  run! if app_file == $0
end
