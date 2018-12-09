require_relative 'die'

class Game
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
    token == 100
  end

  private

  def valid_move?(roll)
    token + roll <= 100
  end
end