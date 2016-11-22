require 'minitest/autorun'
require 'minitest/pride'

require_relative 'green_eggs_and_ham'

class GreenEggsAndHamTest < MiniTest::Test

  def setup
    @book = ::GreenEggsAndHam.new
  end

  def test_01_count_of_total_words
    assert_equal 116, @book.word_count
  end

  def test_02_all_unique_words_sorted
    expected = %w(a am and anywhere do eggs green ham here house i in
      like mouse not or sam sam-i-am that them there with would you)
    assert_equal expected, @book.sorted_unique_words
  end

  def test_03_count_of_words_less_than_four_letters
    assert_equal 59, @book.number_of_words_shorter_than(4)
  end

  def test_04_longest_word
    assert_match(/Sam-I-am/i, @book.longest_word)
  end

  def test_05_how_many_stanzas
    assert_equal 6, @book.stanzas.count
  end

  def test_06_adventure_mode_line_count_should_not_include_blanks
    assert_equal 19, @book.lines.count
  end

  def test_07_adventure_mode_all_unique_words_and_frequency
    expected = {
        "i" => 15, "am" => 2, "sam" => 2, "that" => 3,
        "sam-i-am" => 6, "do" => 11, "not" => 13, "like" => 15,
        "them" => 11, "green" => 3, "eggs" => 3, "and" => 3,
        "ham" => 3, "would" => 4, "here" => 2, "or" => 2,
        "there" => 2, "anywhere" => 2, "you" => 2, "in" => 2,
        "a" => 4, "house" => 2, "with" => 2, "mouse" => 2
    }
    assert_equal expected, @book.frequency_of_unique_words
  end

  def self.test_order
    :alpha
  end
end
