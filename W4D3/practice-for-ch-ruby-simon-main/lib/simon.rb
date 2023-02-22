class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until @game_over == true
      self.take_turn
    end
    self.game_over_message
    self.reset_game
  end

  def take_turn
    self.show_sequence
    self.require_sequence
    if !self.game_over
      self.round_success_message
      self.sequence_length += 1
    end
  end

  def show_sequence
    self.add_random_color
    @seq.each do |color|
      puts color
      sleep 0.75
      system "clear"
      sleep 0.25
    end
  end

  def require_sequence
    puts "Please input sequence by adding the first letter of each color you saw"
    @seq.each do |color|
      user_input = gets.chomp
      if color[0] != user_input
        @game_over = true
        break
      end
    end
  end

  def add_random_color
    self.seq << COLORS.shuffle.sample
  end

  def round_success_message
    puts "Round was successful! Good job! Let's move on!"
  end

  def game_over_message
    puts "Nice try! You went #{@sequence_length - 1} rounds!"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

if $PROGRAM_NAME == __FILE__
  simon = Simon.new
  simon.play
end