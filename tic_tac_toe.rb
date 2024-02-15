# 15/02/2024 Tic-Tac-Toe

class Game
  PLAYER_1 = "X"
  PLAYER_2 = "O"

  @@board_array = [ [1, 2, 3], [4, 5, 6], [7, 8, 9] ]
  @@active_array = Array.new(10)
  @@board = { 1 => nil, 2 => nil, 3 => nil, 4 => nil, 5 => nil,
              6 => nil, 7 => nil, 8 => nil, 9 => nil }
  attr_accessor :board_array


  def initialize
    start
  end

  def display_board
    puts "-------"
    # @@board_array.map { |x| puts x.join('  ') }
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

  def start
    puts "-------"
    puts "Player 1 is (X) and Player 2 is (O)"
    display_board
    Rounds.new
  end
end

class Rounds < Game
  attr_accessor :player_choice, :switch_turns

  def initialize
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
        self.player_choice = gets.chomp
        # check_choice(player_choice)
        update_round(PLAYER_1, player_choice)
      else
        puts "Player 2 pick a number: "
        self.player_choice = gets.chomp
        update_round(PLAYER_2, player_choice)
      end
      i += 1
    end
  end

  def update_round(player, player_choice)
    # @@board.each_with_index do |x|
    #   x.each do |y|
    #     if y == player_choice.to_i
    #       x[x.index(y)] = player
    #     end
    #   end
    # end
    @@board.select do |key, value|
      if key == player_choice.to_i && !value
        @@board[key] = player
      end
    end
    self.switch_turns = !switch_turns
    display_board
  end

  def check_choice

  end

end

new_game = Game.new()
