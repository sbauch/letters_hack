#
# Dictionary Service
#
require 'httparty'

class DictionaryService

    ##
    # Performs a word look up and returns a word_response 
    ##
    def self.lookup( word )

        url = Settings.dictionary_api.url

        response = HTTParty.get url + word

        puts response
    end

end
