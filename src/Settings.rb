



class Settings

  def initialize
    @s_mode_easy = "3-5"
    @s_mode_medium = "6-8"
    @s_mode_hard = "9-20"
  end

  def get_mode(mode)
    case mode
      when "easy" then @s_mode_easy
      when "medium" then @s_mode_medium
      when "hard" then @s_mode_hard
    end
  end

  def print_hello
    puts
    <<~TEXT
       Приветствую! Суть игры в том, что бы отгадать слово.
       Вы можете ошибиться 6 раз.
       На каждом ходу вы должны ввести 1 русскую букву
    TEXT
  end

  def print_ask_complication
    puts
    <<~TEXT
        Введите уровень сложности. Доступные значения: 
         easy #{@s_mode_easy},
         medium #{@s_mode_medium},
         hard #{@s_mode_hard}"
    TEXT
  end

  def print_user_get_mistake
    puts "Вы ошиблись. Такой буквы в слове нет"
  end

  def print_value_is_uncorrect
    puts "Введенное значение невалидно"
  end

  def print_value_is_long
    puts "Введенное значение имеет больше одного символа. Нужно ввести одну русскую букву"
  end

  def print_current_word(str)
    puts "Текущее слово: #{str}"
  end

  def print_ask_letter
    puts "Введите букву: "
  end

  def print_victory
    puts "Вы отгадали все буквы, вы победили!"
  end

  def print_lose
    puts "Вы проиграли"
  end

  def print_gallow(int)
    puts case int
         when 1
           <<~TEXT
           _______
           |     |
           |     O
           |
           |
           |
         __|__
        TEXT
         when 2
           <<~TEXT
          _______
          |     |
          |     O
          |     |
          |
          |
        __|__
        TEXT
         when 3
            <<~TEXT
          _______
          |     |
          |     O
          |    /|
          |
          |
        __|__
        TEXT
         when 4
            <<~TEXT
          _______
          |     |
          |     O
          |    /|\\
          |
          |
        __|__
        TEXT
         when 5
            <<~TEXT
          _______
          |     |
          |     O
          |    /|\\
          |    /
          |
        __|__
        TEXT
         when 6
            <<~TEXT
            _______
            |     |
            |     O
            |    /|\\
            |    / \\
            |
          __|__
           TEXT
        end
  end

  def print_ask_play
    puts "Что-бы начать новую игру введите \"1\""
    puts "Что-бы выйти из приложения введите любой символ"
  end

  def print_count_mistakes(count)
    puts "Осталось жизней: #{count}"
  end
end