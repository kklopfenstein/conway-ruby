# frozen_string_literal: true

$LOAD_PATH << '.'

require 'game'
require 'game_printer'

integer_pattern = /\A\d+\z/

if ARGV.length < 2 || ARGV[0] !~ integer_pattern || ARGV[1] !~ integer_pattern
  puts 'Invalid arguments. Usage: conway.rb <size> <iterations>'
  exit
end

game = Game.new(ARGV[0].to_i)
GamePrinter.print(game)
sleep(1)

(1..ARGV[1].to_i).each do
  game.next_generation
  GamePrinter.print(game)
  sleep(1)
end

puts 'Done.'