module Game
  class Life
    attr_reader :grid, :generations

    def initialize(width = 30, height = 30)
      @grid = Grid.new(width, height)
      @generations = 1
    end

    def cycle
      life_cycle = God.life_cycle(@grid)
      @generations += 1

      God.kill(life_cycle[:to_kill])
      God.give_birth(life_cycle[:to_give_birth])
    end

    def alive_generation?
      grid.living_cells.count > 0
    end

    def draw(canvas)
      grid.living_cells.each do |cell|
        canvas.set(*cell.position)
      end

      grid.dead_cells.each do |cell|
        canvas.unset(*cell.position)
      end

      canvas
    end

  end
end
