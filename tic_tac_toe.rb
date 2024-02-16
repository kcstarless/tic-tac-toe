# 15/02/2024 Tic-Tac-Toe

class Game
  PLAYER_1 = "X"
  PLAYER_2 = "O"

  def initialize
    @board = { 1 => nil, 2 => nil, 3 => nil,
    4 => nil, 5 => nil, 6 => nil,
    7 => nil, 8 => nil, 9 => nil }

    @winning = [ [1, 2, 3], [4, 5, 6], [7, 8, 9],
                 [1, 4, 7], [2, 5, 8], [3, 6, 9],
                 [1, 5, 9], [3, 5, 9] ]

    start
  end

  def display_board
    puts "-------"
    count = 0
    @board.select do |key, value|
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

  def start
    puts "-------"
    puts "Player 1 is (X) and Player 2 is (O)"
    display_board
  end
end

class PlayGame
  attr_accessor :player_choice, :switch_turns

  def initialize
    @new_game = Game.new
    @player_choice = nil
    @switch_turns = false
    start_round
  end

  def start_round
    i = 0
    loop do
      if i == 9
        break
      end
      if switch_turns == false
        puts "Player 1 pick a number: "
        self.player_choice = check_choice(gets.chomp)
        update_round(PLAYER_1, player_choice)
        check_winner(PLAYER_1)
      else
        puts "Player 2 pick a number: "
        self.player_choice = check_choice(gets.chomp)
        update_round(PLAYER_2, player_choice)
        check_winner(PLAYER_2)
      end
      i += 1
    end
  end

  def update_round(player, player_choice)
    @@board.select do |key, value|
      if key == player_choice.to_i && !value
        @@board[key] = player
      end
    end
    self.switch_turns = !switch_turns
    display_board
  end

  def check_choice(choice)
    if @@board.has_key?(choice.to_i) && @@board.values_at(choice.to_i) == [nil]
      return choice
    else
      puts "Invalid number or Position taken:  "
      check_choice(gets.chomp)
    end
  end

  def check_winner(player)
    player_combo = @@board.select {|key, value| value == player}.keys

    @@winning.select do |win_combo|
      return player_combo.sort.join("").include?(win_combo.join(""))
    end
  end

end

new_game = PlayGame.new()
new_game
