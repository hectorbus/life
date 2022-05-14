require_relative 'god'
require_relative 'grid'

class Life
  attr_reader :grid, :cycle_count, :speed

  def initialize(options)
    @width = options['width']
    @height = options['height']
    @speed = options['speed']

    @grid = Grid.new(@width, @height)
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

      break if total_cells_alive == 0

      life_cycle = God.life_cycle(grid)
      @cycle_count += 1

      God.kill(life_cycle[:to_kill])
      God.give_birth(life_cycle[:to_give_birth])

      sleep speed/1000
    end
  end

end
