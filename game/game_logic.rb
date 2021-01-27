class GameLogic
  FIGURE = {
    '1' => "камень",
    '2' => "ножницы",
    '3' => "бумагу"
  }.freeze

  # User input selection and validation
  def user_input
    puts 'Выберите один из вариантов и нажмите Enter: 1 - камень; 2 - ножницы; 3 - бумага'
    loop do
      @person_choice = $stdin.gets.chomp

      puts "Вы выбрали #{FIGURE[@person_choice]}, теперь очередь компьютеру сделать выбор"
      break if FIGURE.key?(@person_choice)

      puts 'Такого варианта нет, попробуйте еще раз!'
    end
  end

  # Random input of a bot from a selection from 1 to 3
  def bot_input
    @bot_choice = rand(1..3).to_s
    puts "Компьютер выбирает #{FIGURE[@bot_choice]}"
  end

  # Method outputs the result
  def results
    return puts 'Ничья!' if @person_choice == @bot_choice
    return puts 'Победа' if win?

    puts 'Вы проиграли!'
  end

  # Method proposes to user exit from the game or retry
  def retry
    loop do
      puts 'Для выхода, ввидите: exit; Для продолжения, нажмите: enter'
      choice = gets.chomp
      break if choice == 'exit'

      user_input
      bot_input
      results
    end
  end

  # The method contains an array of winning combinations and returns true
  # In case the combination of players' input are contained in the array

  private

  def win?
    win_comb = [['1', '2'], ['2', '3'], ['3', '1']]
    win_comb.include?([@person_choice, @bot_choice])
  end
end
