require File.expand_path('Settings.rb')
require File.expand_path('Log.rb')

class Game

  def initialize(isLog)
    @settings = Settings.new

    @s_complication = ""

    @file = File.read("words.txt")

    @s_cur_word = ""

    @s_masked_word = ""

    @log = isLog ? Log.new : nil

    @i_mistakes = 6

    @is_victory = false
  end


  def start
    @settings.print_hello

    ask_complication

    chose_word

    start_round while @i_mistakes > 0 && !@is_victory

    return end_game
  end


  def ask_complication

    set = %w[easy medium hard]

    @settings.print_ask_complication

    enter_val_from_user = gets.chomp

    unless set.include?(enter_val_from_user)
      @settings.print_value_is_incorrect
      ask_complication
    end

    @s_complication = @settings.get_mode(enter_val_from_user)
  end


  def chose_word
    arr_words = @file.split("\n")

    i_min_length = @s_complication.match(/^\d{1,3}/).to_s.to_i
    i_max_length = @s_complication.match(/\d{1,3}$/).to_s.to_i

    arr_words.select!  { |val|
      val.size <= i_max_length && val.size >= i_min_length
    }

    @s_cur_word = arr_words[rand(arr_words.size - 1)]

    @s_masked_word = "_" * @s_cur_word.length

    @log.print_word(@s_cur_word) unless @log.nil?

  end


  def start_round
    @settings.print_current_word(@s_masked_word)

    letter = get_letter

    letter_not_found unless check_exist_letter_in_word(letter)

    check_whole_word_is_solved
  end


  def get_letter
    @settings.print_ask_letter

    enter_letter_from_user = gets.chomp

    validate_letter(enter_letter_from_user)

    return enter_letter_from_user
  end


  def validate_letter(letter)
    isValid = true
    is_pattern_valid = letter.match?(/[а-я]/)

    if letter.size > 1
      @settings.print_value_is_long
      isValid = false
    elsif !is_pattern_valid
      @settings.print_value_is_uncorrect
      isValid = false
    end

    get_letter unless isValid
  end


  def check_exist_letter_in_word(letter)
    is_letter_found = false

    @s_cur_word.each_char.with_index  do |val, i|
      if @s_cur_word[i] == letter
        @s_masked_word[i] = letter
        is_letter_found = true
      end
    end

    is_letter_found ? true : false

  end


  def letter_not_found
    @settings.print_user_get_mistake
    @i_mistakes -= 1
    @settings.print_gallow(@i_mistakes)
    @settings.print_count_mistakes(@i_mistakes)
  end


  def check_whole_word_is_solved
    return if @s_masked_word.include?("_")

    @is_victory = true
  end


  def end_game
    @settings.print_lose if @i_mistakes.zero?
    @settings.print_victory if @i_mistakes.positive?

    @settings.print_ask_play
    gets.chomp == "1"
  end
end