require "drawille"
require 'colorize'
require_relative 'god'
require_relative 'grid'

class Life
  attr_reader :grid, :generation_count, :speed

  def initialize(options)
    @width = options['width']
    @height = options['height']
    @speed = options['speed']

    @grid = Grid.new(@width, @height)
    @generation_count = 1
  end

  def start
    flipbook = Drawille::FlipBook.new

    flipbook.play do
      if grid.living_cells.count > 0
        canvas = to_canvas
        next_generation

        sleep(speed/1000.0)

        canvas
      end
    end

    puts "\nThanks for playing!!!".colorize(:yellow)
    puts "Life lasted for #{generation_count} generations.\n\n".colorize(:light_yellow)
  end

  private

  def to_canvas
    canvas = Drawille::Canvas.new

    grid.living_cells.each do |cell|
      x, y = cell.position
      canvas.set(x, y)
    end

    grid.dead_cells.each do |cell|
      x, y = cell.position
      canvas.unset(x, y)
    end

    canvas
  end

  def next_generation
    life_cycle = God.life_cycle(@grid)
    @generation_count += 1

    God.kill(life_cycle[:to_kill])
    God.give_birth(life_cycle[:to_give_birth])
  end

end
