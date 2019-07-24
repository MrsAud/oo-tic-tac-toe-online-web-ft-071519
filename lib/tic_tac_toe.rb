require 'pry'
class TicTacToe
  attr_accessor :board
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
    ]
    
  def display_board
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end
  
  def input_to_index(input)
    input = input.to_i
    input -= 1
  end
  
  def move(index, token = "X")
    board[index] = token
  end
  
  def position_taken?(index)
    if board[index] == "X" || board[index] == "O"
      true
    else
      false
    end
  end
  
  
  def valid_move?(index)
    true if index.between?(0,8) && position_taken?(index) == false
  end  
  
  def turn_count
    count = 0
    board.each do |position|
      count += 1 if position == "X" || position == "O"
    end
    count
  end
  
  def current_player
    if turn_count % 2 == 0
      "X"
    else
      "O"
    end
  end
  
  def turn
    puts "Please enter a number 1-9."
    input = gets.chomp
    index = input_to_index(input)
    if valid_move?(index) == true
      move(index, current_player)
      display_board
    else
      turn
    end
  end
  
  def won?
    WIN_COMBINATIONS.find do |combo|
      board[combo[0]] == board[combo[1]] &&
      board[combo[1]] == board[combo[2]] &&
      position_taken?(combo[0])
    end
  end
  
  def full?
    board.all? {|position| position == "X" || position == "O"}
  end
  
  def draw?
    true if full? == true && won? == nil
  end
  
  def over?
    true if won? != nil || draw? == true
  end
  binding.pry
  def winner
    return nil if won? == nil
    board[won?[0]]
  end
  
  def play
    until over?
      turn
    end
    
    if won?
      puts "Congratulations #{winner}"
      elsif draw?
      puts "It's a tie."
    end
  end

end