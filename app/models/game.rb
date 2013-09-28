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
  
end