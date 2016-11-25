class Simon
  COLORS = %w(red blue green yellow).freeze

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until @game_over
      take_turn
    end
    game_over_message
    reset_game
    puts "Play again? (y/n):  "
    #play if gets.chomp.casecmp == 'y'
  end

  def take_turn
    show_sequence
    require_sequence
    unless game_over
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    seq.size.times do |i|
      puts seq[i]
      sleep(2)
      system('clear')
    end
  end

  def require_sequence
    player_seq = []

    until player_seq.size == sequence_length
      print "Enter color \##{player_seq.size + 1}:  "
      player_seq << gets.chomp.downcase
      unless player_seq == seq
        @game_over = true
        return nil
      end
    end
  end

  def add_random_color
    seq << COLORS.sample
  end

  def round_success_message
    puts "udabes"
  end

  def game_over_message
    puts "Game over! Your score was #{@sequence_length}"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end
