#
# Word.rb
class Word
    include Mongoid::Document

    embedded_in :round

    field :word, :type => String
    field :def, :type => String
    field :part_of_speech, :type => String
    field :audio_url, :type => String

end