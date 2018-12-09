# As a player
# I want to be able to win the game
# So that I can gloat to everyone around

require 'game'

describe 'Player wins' do

  it 'when Player lands on square 100' do
    given_the_game_has_started
    when_the_token_is_on_square_97
    and_the_token_is_moved_three_spaces
    then_the_player_has_won
  end

  def given_the_game_has_started
    @die = double(:die, roll: 4)
    @game = Game.new(die: @die)
  end

  def when_the_token_is_on_square_97
    24.times { @game.move }
  end

  def and_the_token_is_moved_three_spaces
    allow(@die).to receive(:roll).and_return(3)

    @result = @game.move
  end

  def then_the_player_has_won
    expect(@result).to eq('Player One has won')
  end
end