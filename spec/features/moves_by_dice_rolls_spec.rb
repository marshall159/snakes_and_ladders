# As a player
# I want to move my token based on the roll of a die
# So that there is an element of chance in the game

describe 'Dice rolls' do

  it 'produces a number between one and six' do
    given_there_is_a_die
    when_the_die_is_rolled
    then_the_die_returns_a_number_between_one_and_six
  end

  def given_there_is_a_die
    die = Die.new
  end

  def  when_the_die_is_rolled
    srand(1)
    result = die.roll
  end

  def then_the_die_returns_a_number_between_one_and_six
    expect(result).to eq(6)
  end
end