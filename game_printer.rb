# frozen_string_literal: true

# Prints game state of Conway's Game of Life
class GamePrinter
  def self.print(game)
    system('clear') || system('cls')
    game.state.each do |row|
      row_str = row.map do |cell|
        cell ? ' X ' : ' . '
      end
      puts row_str.join('')
    end
  end
end
