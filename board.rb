class Board
  attr_accessor :current_board
  def initialize(size)
    @size = size
    @current_board = Array.new(size) {|i|  Array.new(size, '_')}
    @ctr = 0
  end

  def place(row, col, char)
    current_board[row][col] = char
    evaluate
    throw :game_over, "GAME_OVER" if is_game_over?
    @ctr += 1
  end

  def evaluate(row, col, char)
    cntinu = true
    # checking vertical
    prow = 0
    vtrue = true
    while prow < size
      vtrue &= current_board[prow][col] == char
      break unless vtrue
      prow = prow + 1
    end
    # check horizontal
    pcol = 0
    htrue = true
    while !vtrue && pcol < size
      htrue &= current_board[row][pcol] == char
      break unless htrue
      prow = prow + 1
    end

    # check dia 1
    prow = 0
    pcol = 0
    while !vtrue && !htrue && (row == col)
      dia1true &= current_board[prow][pcol] == char
      break unless dia1true
      prow += 1
      pcol += 1
    end
    # check dia 2
    prow = 0
    pcol = size
    while !vtrue && !htrue && !dia1true && (row + col == (size - 1))
      dia2true &= current_board[prow][pcol] == char
      break unless dia2true
      prow += 1
      pcol -= 1
    end

    cntinu = false if (vtrue || htrue || dia1true || dia2true)
    throw :game_over, "SOMEONE_WINS" unless cntinu
  end

  def is_game_over?
    return true if @ctr == @size*@size
  end
end
