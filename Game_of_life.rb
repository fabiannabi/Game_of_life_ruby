class Game
  #initial state of the aplication
  def initialize
    @grid = Array.new(5) { Array.new(5) }
    @number_grid = Array.new (5) { Array.new(5) }
    #prints the first generation of cells
    first_generation
    puts "Initial State"
    print_grid
    find_index
    apply_rules
  end

  #prints the first generation of cells
  def print_grid
    system("clear")
    rows = @grid.map do |row|
      row.join(" ")
    end
    print rows.join("\n")
  end

  def print_cell_grid
    system("clear")
    rows = @number_grid.map do |row|
      row.join(" ")
    end
    print rows.join("\n")
  end

  def first_generation
    @grid.each do |row|
      row.map! do |cell|
        if rand(100) < 25
          "x"
        else
          "."
        end
      end
    end
  end

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

  def cell_population(row, column, num)
    @number_grid[row][column] = num
  end

  def find_index
    @number_grid.each_with_index do |subarray, row|
      subarray.each_with_index do |cell, column|
        cell_neighbors_count = find_cells_arround(row, column)
        cell_population(row, column, cell_neighbors_count)
      end
    end
  end

  #Apply the rules of game of life to the number grid, and transforms it to a cell grid
  def apply_rules
    @number_grid.each do |cellrow|
      cellrow.map! do |cell|
        if cell < 2 || cell > 3
          cell = "."
        else
          cell = "x"
        end
      end
    end
    print_cell_grid
  end
end

Game.new()
