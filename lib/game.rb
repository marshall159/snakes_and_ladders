require_relative 'die'
require_relative 'player'

class Game
  LAST_SQUARE = 100

  attr_reader :token, :die

  def initialize(input = {})
    @player = input.fetch(:player, Player.new)
    @die = input.fetch(:die, Die.new)
    @token = 1
  end

  def move
    roll = die.roll
    @token += roll if valid_move?(roll)
    "Player #{player.name} has won" if winner?
  end

  def winner?
    token == LAST_SQUARE
  end

  private

  attr_reader :player

  def valid_move?(roll)
    token + roll <= LAST_SQUARE
  end
end