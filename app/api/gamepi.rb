module Gamepi

  class API < Grape::API

    version 'v1', :using => :header, :vendor => 'vaynerapps'
    format :json

    resource :games do

        desc "POST Create a new device"
        post 'start' do

            game = GameService.start()
        
            return game
        end


        desc "POST post a new word to the game"
        post ':game_id/word/:word' do
        
            GameService.attempt_word \
                params[:word],
                params[:udid],
                params[:duration] # in ms
            
            return { 'status' => 'ok ' }

        end

        desc "Adds a new player to this game, returns the game object as a response"
        post ':game_code/join/' do

            game = GameService.add_player \
                params[:game_code],
                params[:user_name],
                params[:device_token]

            return game

        end

    end

  end

end  

    