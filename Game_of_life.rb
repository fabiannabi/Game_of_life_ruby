class Game
  #initial state of the aplication
  def initialize
    puts "ENTER ONE NUMBER FOR THE MATRIX SIZE"
    @size = gets.chomp().to_i
    puts "HOW MANY CICLES DO YOU WANT TO PERFORM"
    @limit = gets.chomp().to_i
    puts "ENTER THE PROBABILITY FOR THE BORN RATE OF THE INITIAL STATE FROM 1-100 INTEGER"
    @prob = gets.chomp().to_i
    @gen_count = 0
    @grid = Array.new (@size) { Array.new(@size) }

    #prints the first generation of cells
    first_generation
    puts "Initial State"
    print_grid

    #loops the functionality
    cicle()
    puts "\n" + "-----" + "\n"
    puts "THE SIMULATION HAS ENDED"
  end

  #prints the first generation of cells
  def print_grid
    system("clear")
    rows = @grid.map do |row|
      row.join(" ")
    end
    print rows.join("\n")
  end

  def first_generation
    @grid.each do |row|
      row.map! do |cell|
        if rand(100) < @prob
          "x"
        else
          "."
        end
      end
    end
  end

  def cicle()
    #pass the initial variables
    size = @size
    limit = @limit
    #Creates a new matriz to be replace every time
    @number_grid = Array.new (size) { Array.new(size) }

    #functions passed to the index finder functionality
    #finds the number of neighbors arround each indivicual cell
    def find_cells_arround(row, column)
      count = 0
      next_row = row + 1
      next_column = column + 1
      if row + 1 == @grid.length
        next_row = 0
      end
      if column + 1 == @grid.length
        next_column = 0
      end
      if @grid[row][next_column] == "x"
        count += 1
      end
      if @grid[row][column - 1] == "x"
        count += 1
      end
      if @grid[next_row][column] == "x"
        count += 1
      end
      if @grid[next_row][next_column] == "x"
        count += 1
      end
      if @grid[next_row][column - 1] == "x"
        count += 1
      end
      if @grid[row - 1][column] == "x"
        count += 1
      end
      if @grid[row - 1][next_column] == "x"
        count += 1
      end
      if @grid[row - 1][column - 1] == "x"
        count += 1
      end
      return count
    end

    #fills the new matriz every time with the numbers of neighbors of every cell
    def cell_population(row, column, num)
      @number_grid[row][column] = num
    end

    #goes arroud the matriz to count and replace
    @grid.each_with_index do |subarray, row|
      subarray.each_with_index do |cell, column|
        cell_neighbors_count = find_cells_arround(row, column)
        cell_population(row, column, cell_neighbors_count)
      end
    end

    #Apply the rules of game of life to the number grid, and transforms it to a cell grid
    @number_grid.each do |cellrow|
      cellrow.map! do |cell|
        if cell < 2 || cell > 3
          cell = "."
        else
          cell = "x"
        end
      end
    end

    #Resets the origal grid with the new one adds the generation counter for the print and the limit check
    @grid = @number_grid
    @gen_count += 1
    puts "\n" + "-----" + "\n"
    puts "Gen " + @gen_count.to_s
    print_grid

    #check for the limit and restarts the cicle again
    if @gen_count < limit
      star_again
    end
  end

  # add a delay on each round
  def star_again
    sleep 0.2
    cicle
  end
end

Game.new()
