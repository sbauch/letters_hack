class Turn
  include Mongoid::Document
  include Mongoid::Timestamps
  
  embedded_in :game
  
  field :user_id
  field :word
  field :points
  
  
end