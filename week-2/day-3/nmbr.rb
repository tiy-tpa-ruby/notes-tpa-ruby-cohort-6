class Game
  # all code between HERE
  def initialize
    @random_number = rand(1..100)
    @guesses = []
  end

  def prompt_for_guess
    print "What is your guess? "
    gets.chomp
  end

  def show_cheat_mode
    puts "CHEAT MODE: #{@random_number}"
  end

  def have_guesses?
    @guesses.length > 0
  end

  def last_guess
    @guesses.last
  end

  def banner(message)
    2.times do
      puts
    end

    puts "*" * (4 + message.length)
    puts "* #{message} *"
    puts "*" * (4 + message.length)

    2.times do
      puts
    end
  end

  # Use voice instead
  # def banner(message)
  #   %x{say "#{message}"}
  # end

  def play
    banner("Welcome to nmbr!")

    show_cheat_mode

    loop do
      guess = prompt_for_guess.to_i

      if @guesses.include?(guess)
        banner("You already guessed this!")
        next
      end

      if guess < @random_number
        banner("You were too low")

        if have_guesses?
          if guess < last_guess
            banner("You just guessed #{last_guess} you are wasting a guess by guessing too low")
          end
        end
      end

      if guess > @random_number
        banner("You were too high")
        if have_guesses?
          if guess > last_guess
            banner("You just guessed #{last_guess} you are wasting a guess by guessing too high")
          end
        end
      end

      if guess == @random_number
        banner("You are correct")
        break
      end

      @guesses << guess

      if @guesses.length >= 5
        banner("You took too many guesses")
        break
      end
    end
  end
  # ... and here...
end

class GameManager
  def initialize
    @count = 0
  end

  def play
    loop do
      @count = 1

      my_game = Game.new
      my_game.play

      puts "Would you like to play again? (y/n) (you are on your #{@count} game)"
      answer = gets.chomp
      case answer
        when "n", "no", "nope", "nopes"
          break
        when "y", "yes", "yup"
          next
        else
          puts "I didn't understand"
      end

      @count = @count + 1
      # shortcut way
      # if gets.chomp == "n"
      #   break
      # end
    end
  end
end

game_manager = GameManager.new
game_manager.play

# ✅ Pick a random number between 1 and 100
# ✅ Prompt you for a guess
# ✅ If your guess is less than the program's number, it should tell you that you were low and let you guess again.
# ✅ If the guess is greater than the program's number, it should tell you that you were high and let you guess again.
# ✅ If your guess is correct, the program should tell you that you win and then quit.
# ✅ After 5 incorrect guesses, the program should tell you that you lose.

# ✅ If you guess the same number twice, the program should ask you if you're feeling all right (or something similarly sarcastic).
# ✅ Implement everything in a class named Game -- The only code in your ruby class not inside the class will be: Game.new.play
# ✅ Try having the random number to be guessed assigned in the initializer
# ✅ The program should also comment on your behavior if you make a guess that doesn't help you. For example, you might say "50" and then be told "that's too low." If you then guess "25," you're just wasting a guess.
