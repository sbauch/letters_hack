#
# Game Service
#

class GameService

    ##
    # Starts a new game 
    ##
    def self.init_game
        
        # TODO -- randomaly generated a 3 letter word
        word = 'cat'
        
        game = Game.create()
        
        # TODO -- initialize fields as needed

        # Create new round
        round = game.rounds.create \
            :current_word => word

        game.update_attributes \
            :current_round_id => round.id.to_s

        game #return
    end

    ##
    # Ends this game
    ##
    def self.end

    end


    ##
    # Adds a new player to this game
    ## 
    def self.add_player( game_id, user_name, udid )
        game = Game.find game_id
        
        game.players.create \
            :user_name => user_name,
            :udid => udid
    end

    def self.start( game_id )
        game = Game.find game_id
        round = game.current_round()

        round.current_player_id = game.players.first.id.to_s
        round.save!
        
        #
        # TODO -- send push to first player
        # 
    end

    ##
    # Attempts to add this word for the current turn.
    #   If success, will advance the game to the next turn
    #   If fail, will return without modifying the game state
    ##
    def self.attempt_word( game, word_string, duration )
        
        valid = false

        # do work lookup via our api
        word_hash = DictionaryService.lookup word_string

        case word_hash['status_code'].downcase
        when 'ok'
            self.advance game, word_hash
            valid = true
        
        when 'error'
            valid = false

        when 'abbreviation'
            valid = false
        end

        valid
        
    end

    ##
    # Advances the game to the next turn
    # If there is a word, then update the current word & status
    # If there isn't, then update the pass count
    ##
    def self.advance( game, word_hash )
        advance = false
        round = game.current_round()
        
        round.turn_count+=1

        if word_hash.nil? # if there's no word, then this is effectivly a pass
            
            puts ' --> no word'
            
            round.pass_count+=1
            
            if round.pass_count >= round.players.length
                advance = false
            end

        else
            puts ' --> updating word'
            
            # update current word and status
            round.current_word = word_hash['word']
            round.current_length = word_hash['word'].length
            
            round.words.create! \
                :word => word_hash['word'],
                :def => word_hash['def'],
                :part_of_speech => word_hash['part_of_speech'],
                :audio_file => word_hash['audio_file']
        end

        if advance
            # update to the next player
            index = round.players[round.current_player] + 1
            round.current_player = game.players[index]
        end

        round.save()

        advance
    end
end