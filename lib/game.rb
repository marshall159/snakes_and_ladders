require_relative 'die'

class Game
  LAST_SQUARE = 100

  attr_reader :token, :die, :name

  def initialize(input = {})
    @name = input.fetch(:name, 'One')
    @die = input.fetch(:die, Die.new)
    @token = 1
  end

  def move
    roll = die.roll
    @token += roll if valid_move?(roll)
    "Player #{name} has won" if winner?
  end

  def winner?
    token == LAST_SQUARE
  end

  private

  def valid_move?(roll)
    token + roll <= LAST_SQUARE
  end
end