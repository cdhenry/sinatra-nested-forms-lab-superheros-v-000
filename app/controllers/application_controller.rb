require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
      erb :team
    end

    get '/teams' do
      
    end

    post '/teams' do
      @team = Team.new(params[:team])

      params[:team][:hero].each do |details|
        SuperHero.new(details)
      end

      @heroes = SuperHero.all
      erb :super_hero.erb
    end
end
