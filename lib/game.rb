require_relative 'die'

class Game
  attr_reader :token, :die

  def initialize(die = Die.new)
    @die = die
    @token = 1
  end

  def move
    @token += die.roll
  end
end