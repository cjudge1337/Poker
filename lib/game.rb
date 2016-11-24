class Game

  attr_accessor :deck, :players

  def initialize()
    @deck = Deck.new
    @players = []
  end

  def play
    puts "How many players?"
    num_players = gets.chomp.to_i

    num_players.times do |i|
      @players << Player.new
    end

    deal
  end

  def deal
    players.each do |playa|
      5.times { playa.hand << deck.remove_card}
    end
  end

end
