class Game
  include Mongoid::Document
  include Mongoid::Timestamps
    
  embeds_many :turns
  has_many :rounds
  has_many :players

  before_create :make_short_code
  
  field :short_code 

  #
  # Meta data about this game
  field :start_time, :type => Date
  field :players, :type => Array

  field :current_round_id, :type => String, :default => ''
  field :current_word, :type => String


  def make_short_code
    o = ('A'..'Z').to_a.map { |i| i.to_a }.flatten
    string = (0...5).map{ o[rand(o.length)] }.join
    self.short_code = string
  end

  def current_round
    Round.find current_round_id
  end

  def current_player
    current_round().current_player
  end

end