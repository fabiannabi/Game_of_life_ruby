# Game_of_life_ruby

MagmaLabs MiniTest

Implement the game of life with ruby

The program runs on the comand line on

`ruby Game_of_life.rb`

Generates a Initial grid, and fully fills each space on a probability of 25%

Runs for 50 cicles and aplies the following rules to each an avery new grid generated

Any living cell with fewer than two live neighbours dies, as if caused by underpopulation.
● Any living cell with more than three live neighbours dies, as if by overcrowding.
● Any living cell with two or three live neighbours lives on to the next generation.
● Any dead cell with exactly three live neighbours becomes a live cell.

Adds a 0.2s delay on each iteration of the cicle
