class Game
  include Mongoid::Document
  include Mongoid::Timestamps
  
  embeds_many :turns


  before_create :make_short_code
  
  field :short_code   
  
  def make_short_code
    o = ('A'..'Z').to_a.map { |i| i.to_a }.flatten
    string = (0...5).map{ o[rand(o.length)] }.join
    self.short_code = string
  end

  #
  # Meta data about this game
  field :start_time, :type => Date
  field :players, :type => Array


  #
  # Keeps track of the current state of the game
  field :current_word, :type => String, :default => ''
  field :current_length, :type => String, :default => 3
  field :current_player, :type => Player
  field :pass_count, :type => Int, :default => 0 #when this is == to the num of players, teh game should auto-magically end

  #
  # Track history
  field :word_history, :type => Array, :default => []

  
end