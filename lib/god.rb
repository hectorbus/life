class God

  def self.will
    [true, false].sample
  end

  def self.kill(cells)
    cells.each(&:kill!)
  end

  def self.give_birth(cells)
    cells.each(&:give_birth!)
  end

  def self.life_cycle(grid)
    living_cells = grid.living_cells
    dead_cells = grid.dead_cells

    cycle = {
      to_kill: [],
      to_give_birth: []
    }

    # Any live cell with two or three live neighbours survives.
    living_cells.each do |cell|
      alive_neighbours_count = grid.alive_neighbours_for(cell)

      cycle[:to_kill] << cell unless [2, 3].include?(alive_neighbours_count)
    end

    # Any dead cell with three live neighbours becomes a live cell.
    dead_cells.each do |cell|
      alive_neighbours_count = grid.alive_neighbours_for(cell)

      cycle[:to_give_birth] << cell if alive_neighbours_count == 3
    end

    cycle
  end

end
