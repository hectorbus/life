module Game
  class Grid
    attr_reader :width, :height, :matrix

    def initialize(width = 30, height = 30)
      @width = width
      @height = height

      @matrix = build_matrix
    end

    def build_matrix
      Array.new(width).map.with_index do |x, i|
        Array.new(height).map.with_index do |y, j|
          Cell.new(i, j)
        end
      end
    end

    def living_cells
      matrix.flatten.select(&:alive?)
    end

    def dead_cells
      matrix.flatten.select(&:dead?)
    end

    def alive_neighbours_for(cell)
      neighbours_for(cell).count(&:alive?)
    end

    def neighbours_for(cell)
      x, y = cell.position

      left = [
        [x - 1, y - 1].any?(&:negative?) ? nil : matrix[x - 1]&.at(y - 1),
        [x - 1, y + 1].any?(&:negative?) ? nil : matrix[x - 1]&.at(y + 1),
        (x - 1).negative? ? nil : matrix[x - 1]&.at(y)
      ]

      middle = [
        (y + 1).negative? ? nil : matrix[x]&.at(y + 1),
        (y - 1).negative? ? nil : matrix[x]&.at(y - 1)
      ]

      right = [
        [x + 1, y - 1].any?(&:negative?) ? nil : matrix[x + 1]&.at(y - 1),
        [x + 1, y + 1].any?(&:negative?) ? nil : matrix[x + 1]&.at(y + 1),
        (x + 1).negative? ? nil : matrix[x + 1]&.at(y)
      ]

      (left + middle + right).compact
    end

  end
end
