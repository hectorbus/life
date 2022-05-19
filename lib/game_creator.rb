require "drawille"
require "colorize"
require "game"

class GameCreator
  attr_reader :flipbook, :life, :speed

  def initialize(options)
    width, height, @speed = validations(options)

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
    canvas = life.draw(Drawille::Canvas.new)
    life.cycle
    sleep(speed/1000.0)
    canvas
  end

  def thanks_for_playing
    puts "\nThanks for playing!!!".colorize(:yellow)
    puts "Life lasted for #{life.generations} generations.\n\n".colorize(:light_yellow)
  end

  def validations(options)
    options.map do |key, value|
      raise ArgumentError.new("#{key.capitalize} must be grater than zero.") if value <= 0
      value
    end
  end

end
