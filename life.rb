# Conway's Game of Life

# The Game of Life, also known simply as Life, is a cellular automaton devised by the British mathematician John Horton Conway in 1970.
# It is a zero-player game, meaning that its evolution is determined by its initial state, requiring no further input.
# One interacts with the Game of Life by creating an initial configuration and observing how it evolves.
# It is Turing complete and can simulate a universal constructor or any other Turing machine.

# https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life

require_relative 'god'
require_relative 'grid'

class Life
  attr_reader :grid, :cycle_count, :time_interval

  def initialize(width, height, time_interval = 1000)
    @width = width
    @height = height
    @time_interval = time_interval

    @grid = Grid.new(width, height)
    @cycle_count = 1
  end

  def start
    loop do
      total_cells_alive = grid.living_cells.count
      total_cells_dead = grid.dead_cells.count

      # TODO: Create UI to visualy display life cycle and replace text prints.
      p "Cycle count: #{cycle_count}"
      p "Total Cells alive: #{total_cells_alive}"
      p "Total Cells dead: #{total_cells_dead}"
      p "----------------------------------------"

      life_cycle = God.life_cycle(grid)
      @cycle_count += 1

      God.kill(life_cycle[:to_kill])
      God.give_birth(life_cycle[:to_give_birth])

      sleep time_interval/1000
    end
  end

end
