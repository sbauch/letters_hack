#
# round
#

class Round

  belongs_to :game

  #
  # Keeps track of the current state of the game
  field :current_word, :type => String, :default => ''
  field :current_length, :type => String, :default => 3
  field :current_player, :type => Player
  field :pass_count, :type => Integer, :default => 0 #when this is == to the num of players, teh game should auto-magically end

  #
  # Track history
  field :word_history, :type => Array, :default => []
  field :turn_count, :type => Integer, :default => 0


end