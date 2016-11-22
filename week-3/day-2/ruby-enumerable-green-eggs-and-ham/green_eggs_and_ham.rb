class GreenEggsAndHam
  def initialize
    @text = File.read('green_eggs_and_ham.txt')
    @words = @text.split(/[ .!?,\n]/).reject { |word| word.empty? }
  end

  def word_count
    @words.count
  end

  def sorted_unique_words
    @words.map { |word| word.downcase }.uniq.sort
  end

  def number_of_words_shorter_than(count)
    @words.count { |word| word.length < count }
  end

  def frequency_of_unique_words
    frequencies = {}

    sorted_unique_words.each do |unique_word|
      # count how many times does word appear
      frequencies[unique_word] = @words.count { |word| word.downcase == unique_word }
    end

    return frequencies
  end

  def lines
    @text.split("\n").reject { |line| line.empty? }
  end

  def stanzas
    @text.split("\n\n")
  end

  def longest_word
    @words.max { |word| word.length }
  end


end
