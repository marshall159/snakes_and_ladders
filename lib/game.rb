require_relative 'die'

class Game
  attr_reader :token, :die

  def initialize(die = Die.new)
    @die = die
    @token = 1
  end

  def move
    roll = die.roll
    if token + roll <= 100
      @token += roll
    end
  end

  def winner?
    token == 100
  end
end