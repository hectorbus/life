require_relative 'god'

class Cell
  attr_accessor :position
  attr_reader :alive

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
