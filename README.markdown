# simple-elo

This gem offers a simple way to calculate the new Elo ratings for two players based on their current ratings, the outcome of a game, and an optional k-factor (the default is 10).

### Usage

    # player one rating, player two rating, victory, default k-factor of 10
    SimpleElo::Rating.compute(1000, 1000, 1)
    => {:player_one_rating=>1005, :player_two_rating=>995}

    # same, with a k-factor of 20
    SimpleElo::Rating.compute(1000, 1000, 1, 20)
    => {:player_one_rating=>1010, :player_two_rating=>990}
    
### Win / Loss / Draw

The third parameter to `#compute` accepts the values `[0, 0.5, 1]`, which describe the outcome of the match. A value of `0` indicates that player one lost. A value of `0.5` indicates that the match was a draw. Finally, a `1` indicates that player one was the victor.

Note: this parameter should *always* reflect the outcome of the match from the perspective of player one.

### Closing Thoughts 

Nothing more, nothing less. Enjoy!

> ["Gunter, who told you you could fly?"](http://www.youtube.com/watch?v=Ar_8Tm7jnyQ)
