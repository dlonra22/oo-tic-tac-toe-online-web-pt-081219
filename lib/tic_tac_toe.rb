require 'pry'
class TicTacToe
  WIN_COMBINATIONS = [[0,1,2], [3,4,5,], [6,7,8],
  [0,3,6], [1,4,7], [2,5,8],
  [0,4,8], [2,4,6]]
  def initialize
    @board = Array.new(9," ")
  end
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  def display_empty_board
    puts " 1 | 2 | 3 "
    puts "-----------"
    puts " 4 | 5 | 6 "
    puts "-----------"
    puts " 7 | 8 | 9 "
  end

  def input_to_index(input)
    index = input.to_i - 1 
    index
  end
  
  def move(index, token = "X")
      @board[index] = token
      @board
  end
  
  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O" ? true : false
  end
  
  def valid_move?(index)
      
      index.between?(0,8) && !position_taken?(index) ? true : false
  end
  
  def turn_count
    @board.count {|turn| (turn=="X" || turn =="O")}
  end
  
  def current_player
      (turn_count % 2).even? ? "X": "O"
  end
  
  def turn
    display_empty_board
    player = current_player
    puts "please choose a position 1 to 9 to play on the board. Its the turn of: #{player}"
    input = gets
    index = input_to_index(input)
    if valid_move?(index)
       move(index, player)
     else
       turn
    end
    display_board
  end
  
  def won?
    o = []
    x = []
    winner = []
    @board.each_with_index do |item, index|
      if item == 'X'
        x << index
        end
      if item == 'O'
        o << index
        end
    end
   
  winner = WIN_COMBINATIONS.select do |arry|
      (x.permutation(3).to_a.find {|permx|arry==permx}) || (o.permutation(3).to_a.find {|permo| permo == arry})
    end
     winner.length > 0 ? winner[0]: false
  end
  
def full?
  holder = @board.select {|item| item == 'X' || item == 'O'}
  
  holder.length == 9 && !won? ? true : false
end

def draw?
  full?
end

def over?
  draw? || won? ? true : false
end

def winner
  if current_player == 'X'
    p_win = 'O'
  else
    p_win = 'X'
  end
  won? ? p_win : false
end

end #class end

  
  
  