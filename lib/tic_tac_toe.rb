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
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    input = input.to_i
    input -= 1
  end
  
  def move(index, token = "X")
    @board[index] = token
  end
  
  def position_taken?(index)
    if @board[index] == "X" || @board[index] == "O"
      true
    else
      false
    end
  end
  
  
  def valid_move?(index)
    true if index == 0..9 && position_taken?(index) == false
  end  
  
  def turn_count
    count = 0
    @board.each do |position|
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
    #iterate through WIN_COMBINATIONS
    WIN_COMBINATIONS.each do |combo|
      puts "#{combo}" if (@board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X") || (@board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O")
    end
    false
    # true if @board[win_combinations] = "X" "X" "x" or "O" "O" "O"
  end
  
  
  
  
  
  
  
  
  
  
  
  
  
  
end