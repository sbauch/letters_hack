class Game
  include Mongoid::Document
  include Mongoid::Timestamps
  
  embeds_many :turns
  has_many :rounds

  before_create :make_short_code
  
  field :short_code 

  #
  # Meta data about this game
  field :start_time, :type => Date
  field :players, :type => Array

  field :current_round_id, :type => Integer


  def make_short_code
    o = ('A'..'Z').to_a.map { |i| i.to_a }.flatten
    string = (0...5).map{ o[rand(o.length)] }.join
    self.short_code = string
  end

  def current_round
    @rounds.find @current_round_id
  end

end