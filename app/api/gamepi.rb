module Gamepi

  class API < Grape::API

    version 'v1', :using => :header, :vendor => 'vaynerapps'
    format :json

    resource :games do

        desc "GET Create a new game"
        get 'start' do
            puts 'starting game..'
            game = GameService.init_game
        end


        desc "POST post a new word to the game"
        get ':game_id/word/:word' do
        
            GameService.attempt_word \
                params[:word],
                params[:udid],
                params[:duration] # in ms
            
            return { 'status' => 'ok ' }

        end

        desc "Adds a new player to this game, returns the game object as a response"
        get ':game_code/join/' do

            puts 'joining game..'

            game = GameService.add_player \
                params[:game_code],
                params[:user_name],
                params[:device_token]

            game
        end

    end

  end

end  

    