# As a player
# I want to be able to move my token
# So that I can get closer to the goal

require 'game'

describe 'Token' do

  it 'moves across the board' do
    given_the_game_has_started
    and_the_token_is_on_the_board
    when_the_token_is_moved
    then_the_token_moves_to_another_square
  end

  def given_the_game_has_started
    @game = Game.new
  end

  def and_the_token_is_on_the_board
    @game.token.position
  end

  def when_the_token_is_moved
    @game.turn
  end

  def then_the_token_moves_to_another_square
    expect { @game.turn }.to change {@game.token.position}.by_at_least(1)
    expect { @game.turn }.to change {@game.token.position}.by_at_most(6)
  end
end