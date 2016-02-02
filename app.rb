require 'sinatra/base'
require_relative './lib/player'

class Battle < Sinatra::Application
  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/names' do
    $player1 = Player.new(params[:player1])
    $player2 = Player.new(params[:player2])
    redirect '/play'
  end

  get '/play' do
    @hp = $player2.hp
    @player1 = $player1.name
    @player2 = $player2.name
    erb(:play)
  end

  post '/attack' do
    redirect '/attack'
  end

  get '/attack' do
    @hp = $player2.attacked
    erb :attack
  end

  run! if app_file == $0
end
