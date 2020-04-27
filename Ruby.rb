class Card
  def initialize(suits, types)
    @suit = suits.sample # random for suit
    @type = types.sample # random for type
  end

  # getters
  attr_reader :suit
  attr_reader :type
end

class Combination
  def initialize(cards)
    @cards = cards
  end
  
  def find_winner
    comb_winner = [] # array for winning combination
    dupl_type = Hash.new(0) # hash to count same types
    dupl_suit = Hash.new(0) # hash to count same suits

    puts 'Name of winner combination:'
    @cards.each do |v|
      dupl_type[v.type] += 1
      dupl_suit[v.suit] += 1
    end
    
    dupl_suit.each do |k, v|
      if v == 5
        puts 'Flush'
        comb_winner << k
      end
    end

    pair_count = 0
    set_count = 0

    dupl_type.each do |k, v|
      if v == 2
        pair_count += 1
        comb_winner << k
      elsif v == 3
        set_count += 1
        comb_winner << k
      end
    end

    if set_count.positive? && pair_count.positive?
      puts 'Full house'
    elsif set_count.positive? && pair_count < 1
      puts 'Three'
    elsif pair_count == 1
      puts 'Pair'
    elsif pair_count > 1
      puts 'Double Pair'
    end
    
    puts 'Winner combination includes:'
    @cards.each do |j|
      if comb_winner.include? j.suit
        puts "Suit: #{j.suit}, type: #{j.type}"
      elsif comb_winner.include? j.type
        puts "Suit: #{j.suit}, type: #{j.type}"
      end
    end
  end
end

class Main
  def run
    suits = ['H', 'D', 'C', 'S'] # all suits
    types = ['J', 'Q', 'K', 'A']
    numbers = [*2..10]
    numbers = numbers.map(&:to_s)
    types += numbers # all types

    cards = []

    i = 0
    puts 'Hand:'

    while i < 2
      card = Card.new(suits, types)
      puts "Suit: #{card.suit}, type: #{card.type}"
      cards << card
      i += 1
    end

    i = 0
    puts 'Flop:'

    while i < 5
      card = Card.new(suits, types)
      puts "Suit: #{card.suit}, type: #{card.type}"
      cards << card
      i += 1
    end

    comb = Combination.new(cards)
    comb.find_winner
  end
end

a = Main.new
a.run
