module Gamepi

  class API < Grape::API

    version 'v1', :using => :header, :vendor => 'vaynerapps'
    format :json

    #
    # Authentication and user
    #
    
    # helpers do
    #   def current_user
    #     @current_user ||= User.authorize!(env)
    #   end
    # 
    #   def authenticate!
    #     error!('401 Unauthorized', 401) unless current_user
    #   end
    # end

    resource :games do

        desc "GET all content for a given team"
        get ':game_id/word/:word' do
        
            return { 'status' => 'ok ' }

        end

    end

  end
end  

    