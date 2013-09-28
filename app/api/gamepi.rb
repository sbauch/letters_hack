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

        desc "Adds a new player to this game"
        get ':game_id/join/' do

            GameService.add_player \
                params[:game_id],
                params[:user_name],
                params[:udid]

            return { 'status' => 'ok ' }

        end

    end

  end

end  

    