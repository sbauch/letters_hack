#
# round
#

class Round
  include Mongoid::Document

  belongs_to :game
  embeds_many :words

  #
  # Keeps track of the current state of the game
  field :current_word, :type => String, :default => ''
  field :current_length, :type => String, :default => 3
  field :current_player_id, :type => String
  field :pass_count, :type => Integer, :default => 0 #when this is == to the num of players, teh game should auto-magically end

  #
  # Track history
  field :turn_count, :type => Integer, :default => 0

  def current_player
    Player.find current_player_id
  end


end