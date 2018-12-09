require_relative 'die'

class Game
  LAST_SQUARE = 100

  attr_reader :token, :die

  def initialize(die = Die.new)
    @die = die
    @token = 1
  end

  def move
    roll = die.roll
    @token += roll if valid_move?(roll)
  end

  def winner?
    token == LAST_SQUARE
  end

  private

  def valid_move?(roll)
    token + roll <= LAST_SQUARE
  end
end