class Turn
  include Mongoid::Document
  include Mongoid::Timestamps
  
  embedded_in :game
  
end