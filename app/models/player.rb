class Player
  include Mongoid::Document

  belongs_to :game

  field :user_name, :type => String, :default => ''
  field :udid, :type => String, :default => ''

  #
  # TODO -- parse specific fields here
  #


end