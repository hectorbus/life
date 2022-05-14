module Game
  class Cell
    attr_reader :alive, :position

    def initialize(x, y)
      @alive = God.will
      @position = [x, y]
    end

    def alive?
      alive
    end

    def dead?
      !alive
    end

    def kill!
      @alive = false
    end

    def give_birth!
      @alive = true
    end

  end
end
