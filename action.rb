class GameAction

  def initialize(board)
    @board = board
  end

  def make_a_move(player, input)
    row, col = validate_and_parse(input)
    msg = catch(:game_over) do
      @board.place(row, col, player.char)
    end

    case msg
    when "GAME_OVER"
      throw :game_end, "No more move to make"
    when "SOMEONE_WINS"
      throw :game_end, "#{player.name} wins"
    end
  end

  private

  def validate_and_parse(input)
    # todo check if row col is valid
    # check if the position already filled
    return input.split(",").map(&:to_i)
  end
end
