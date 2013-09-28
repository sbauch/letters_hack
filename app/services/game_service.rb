#
# Game Service
#

class GameService

    ##
    # Starts a new game 
    ##
    def self.start
        game = Game.new
    end

    ##
    # Ends this game
    ##
    def self.end

    end


    ##
    # Adds a new player to this game
    ## 
    def self.add_player( game, player )
        game.players.push player

        nil # no return
    end

    ##
    # Attempts to add this word for the current turn.
    #   If success, will advance the game to the next turn
    #   If fail, will return without modifying the game state
    ##
    def self.attempt_word( game, word )
        
        # do work lookup via our api
        response = DictionaryService.lookup word

        case response.status_code.downcase
        when 'ok'
            self.advance word
            return true
        
        when 'error'
            return false

        when 'abbreviation'
            return false
    end

    ##
    # Advances the game to the next turn
    # If there is a word, then update the current word & status
    # If there isn't, then update the pass count
    ##
    def self.advance( game, word )

    end


end