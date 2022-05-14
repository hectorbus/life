require "drawille"
require "colorize"
require "game"

class Creator
  attr_reader :flipbook, :life, :speed

  def initialize(options)
    width, height, @speed = options.values

    @flipbook = Drawille::FlipBook.new
    @life = Game::Life.new(width, height)
  end

  def start
    flipbook.play do
      draw if life.alive_generation?
    end

    thanks_for_playing
  end

  private

  def draw
    canvas = to_canvas
    life.cycle
    sleep(speed/1000.0)
    canvas
  end

  def to_canvas
    life.draw(Drawille::Canvas.new)
  end

  def thanks_for_playing
    puts "\nThanks for playing!!!".colorize(:yellow)
    puts "Life lasted for #{life.generations} generations.\n\n".colorize(:light_yellow)
  end

end
