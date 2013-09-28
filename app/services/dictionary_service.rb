#
# Dictionary Service
#
require 'httparty'

class DictionaryService

    ##
    # Performs a word look up and returns a word_response 
    ##
    def self.lookup( word )
        response = HTTParty.get Settings.dictionary_api.url + word
    end

end
