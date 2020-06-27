class Game
  #initial state of the aplication
  def initialize
    @grid = Array.new(5) { Array.new(5) }
    #prints the first generation of cells
    first_generation
    puts "Initial State"
    print_grid
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
        if rand(100) < 25
          "x"
        else
          "."
        end
      end
    end
  end
end

Game.new()
