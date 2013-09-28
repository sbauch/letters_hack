#
# Game Service
#

class GameService

    ##
    # Starts a new game 
    ##
    def self.start
        game = Game.new
        # TODO -- initialize fields as needed
        
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
    end

    ##
    # Advances the game to the next turn
    # If there is a word, then update the current word & status
    # If there isn't, then update the pass count
    ##
    def self.advance( game, word )
        advance = false
        round = game.current_round()
        
        round.turn_count++

        if word.nil? # if there's no word, then this is effectivly a pass
            
            round.pass_count++
            
            if round.pass_count >= round.players.length
                advance = false
            end

        else
            # update current word and status
            round.current_word = word
            round.current_length = word.length
        end

        if advance
            # update to the next player
            index = round.players[round.current_player] + 1
            round.current_player = round.players[index]
        end

        round.save()

        advance
    end
end