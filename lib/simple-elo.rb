require 'ostruct'

module SimpleElo
  module Rating
    class << self
      def compute(p1_rating, p2_rating, result, k_factor=10)
        # The outcome is always from player one's perspective; to get a rating for player two,
        # we flip the match result (unless it's a draw) and perform the same operations with the
        # rating values switched as well. The ratings for both players are returned as output.
        game         = create_game(p1_rating, p2_rating, result, k_factor)
        reverse_game = create_game(p2_rating, p1_rating, flip(result), k_factor)

        { :player_one_rating => calculate(game), :player_two_rating => calculate(reverse_game) }
      end

      protected

      def create_game(p1_rating, p2_rating, result, k_factor)
        game = OpenStruct.new
        game.player_one_rating = p1_rating
        game.player_two_rating = p2_rating
        game.k_factor          = k_factor
        game.result            = result
        game
      end

      def flip(result)
        return result if result == 0.5
        result == 0 ? 1 : 0
      end

      def calculate(game)
        (game.player_one_rating.to_f + (game.k_factor.to_f * (game.result.to_f - expected_score(game)))).to_i
      end

      def expected_score(game)
        1.0 / ( 1.0 + ( 10.0 ** ((game.player_two_rating.to_f - game.player_one_rating.to_f) / 400.0 )))
      end
    end
  end
end