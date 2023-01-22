# Mastermind


Game of [Mastermind](https://en.wikipedia.org/wiki/Mastermind_(board_game)) recreated in Ruby. 

Game is in playable state, but it only has 4 long codes to break, and only 10 rounds to guess correctly. Correct choice in correct position is represented with number 1, correct choice on wrong position is represented with number 2, and wrong choice is represented with number 3. There are 6 colors to chose from, and they are represented by their first letter. 

There should be also choice about role, code breaker or code setter. This should be easy to implement, but logic for computer to choose would be pain to code, so I won't do it yet. Later down the line I'll return to this code to finish this portion, part where number of rounds and number of symbols in code can be chosen. Maybe even some basic UI to look decent. 

Also, there is a bug that sometime shows 3 correct in correct position, and one on wrong position.