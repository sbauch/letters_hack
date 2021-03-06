module Gamepi

  class API < Grape::API

    version 'v1', :using => :header, :vendor => 'vaynerapps'
    format :json

    resource :games do

        desc "GET Create a new game"
        get 'init' do
            puts 'init new game..'
            game = GameService.init_game
        end

        desc "GET Create a new game"
        get ':game_id/start' do
            puts 'starting game..'
            game = GameService.start params[:game_id]

            game
        end


        desc "POST post a new word to the game"
        get ':game_id/word/:word' do
        
            result = GameService.attempt_word \
                params[:game_id],
                params[:word],
                params[:device_token],
                params[:duration] # in ms
            
            
            if result == false
                error!({ "error" => "bad word" }, 500)
            else
                { 'status' => 'ok' }
            end
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

    