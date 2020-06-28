# Game_of_life_ruby
Requieres Ruby

MagmaLabs MiniTest.

Implement the game of life with ruby.

Runs on the command line with the following command.

`ruby Game_of_life.rb`

Generates an Initial 20 by 20 grid, and fully fills each space.
On a probability of 25% a living cell "x" , 75% a dead cell ".".

Runs for 50 cicles and applies the following rules to each grid generated.

● Any living cell with fewer than two live neighbours dies, as if caused by underpopulation.\
● Any living cell with more than three live neighbours dies, as if by overcrowding.\
● Any living cell with two or three live neighbours lives on to the next generation.\
● Any dead cell with exactly three live neighbours becomes a live cell.

Prints the new grid, with the result of the new generation of cells

Adds a 0.2s delay on each iteration of the cicle
