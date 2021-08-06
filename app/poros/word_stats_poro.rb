class WordStatsPoro
  attr_reader :avg_per_book,
              :most_frequent,
              :longest_word

  def initialize(attributes)
      @avg_per_book = attributes[:avg_per_book]
      @most_frequent = attributes[:most_frequent]
      @longest_word = attributes[:longest_word]
  end
end
