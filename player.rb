class Player
  attr_accessor :name, :char
  def initialize(name, char)
    @name = name
    @char = char
  end

  def set_player_char(input)
  end

  def get_input
    inp = gets.chomp
  end
end
