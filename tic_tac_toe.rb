# 15/02/2024 Tic-Tac-Toe

class Board
  # Players signs & Rounds
  PLAYER_1 = "X"
  PLAYER_2 = "O"
  ROUNDS = 10

  # Board in hash
  @@board = { 1 => nil, 2 => nil, 3 => nil,
              4 => nil, 5 => nil, 6 => nil,
              7 => nil, 8 => nil, 9 => nil }
  # Winning lines
  @@line = [ [1, 2, 3], [4, 5, 6], [7, 8, 9],
             [1, 4, 7], [2, 5, 8], [3, 6, 9],
             [1, 5, 9], [3, 5, 7] ]


  def initialize
    puts "-------"
    puts "Player 1 is (X) and Player 2 is (O)"
    display_board
  end

  # Display board and update
  def display_board
    puts "-------"
    count = 0
    @@board.select do |key, value|
      if value == nil
        print "#{key}  "
      else
        print "#{value}  "
      end
      if count == 2 || count == 5
        puts " "
      end
      count += 1
    end
    puts ""
    puts "-------"
  end
end

class Game < Board
  attr_accessor :switch_turns

  def initialize
    @new_board = Board.new
    @switch_turns = false
    play_game
  end
  private
  def play_game
    ROUNDS.times do |i|
      if i == 9
        puts "It's a Draw!"
        game_end
      end
      # Input from player or switched player
      if switch_turns == false
        print "Player X mark position: "
        update_game(PLAYER_1, check_choice(gets.chomp))
      else
        print "Player O mark position: "
        update_game(PLAYER_2, check_choice(gets.chomp))
      end
    end
  end

  # Update the game and check for winner.
  def update_game(player, choice)
    @@board.select do |key, value|
      if key == choice.to_i
        @@board[key] = player
      end
    end
    self.switch_turns = !switch_turns   # Switch player.
    display_board # Display current board

    # Check for winner.
    if is_winner(player)
      puts "Player #{player} WINS!"
      game_end
    end
  end

  # Checks if player input is valid and reprompt if invalid
  def check_choice(choice)
    if @@board.has_key?(choice.to_i) && @@board.values_at(choice.to_i) == [nil]
      return choice
    else
      print "Invalid number/Position taken:  "
      check_choice(gets.chomp)
    end
  end

  # Checks if there is winner if found exit
  def is_winner(player)
    # Collect current player positions
    player_line = @@board.select {|key, value| value == player}.keys

    @@line.collect do |winning_line|
      if (winning_line - player_line).empty? # If empty then is winner.
        return true
      end
    end

    return false
  end

  # End game
  def game_end
    exit
  end

end

new_game = Game.new()
