#
# Dictionary Service
#
require 'httparty'
require 'json'

class DictionaryService

    ##
    # Performs a word look up and returns a word_response 
    ##
    def self.lookup( word )
        response = HTTParty.get Settings.dictionary_api.url + word

        hash = JSON.parse response

        puts hash
        hash
    end

end
