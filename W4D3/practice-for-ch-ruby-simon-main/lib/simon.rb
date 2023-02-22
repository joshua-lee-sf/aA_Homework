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
    if @game_over == true
      self.game_over_message
      self.reset_game
    end
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
  end

  def require_sequence
  end

  def add_random_color
    colors = ["red", "blue", "yellow", "green"]
    self.seq << colors.sample
    if self.seq.length > 1
      self.sequence_length += 1
    end
  end

  def round_success_message
    puts "Round was successful! Good job! Let's move on!"
  end

  def game_over_message
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end