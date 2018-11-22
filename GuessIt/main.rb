class Oracle

  attr_reader :number

  def initialize(range)

    rand = Random.new
    @number = rand(1..range)

  end

  def is_it?(guess)

    @number <=> guess

  end
end

class RandomPlayer

  attr_reader :current_guess, :name

  def initialize(name, oracle, range)

    @name = name
    @oracle = oracle
    @range = range

  end

  def guess

    rand = Random.new
    @current_guess = rand(1..@range)
    @oracle.is_it?(@current_guess)

  end
end

class SmartPlayer

  attr_reader :current_guess, :name

  def initialize(name, oracle, range)

    @name = name
    @oracle = oracle
    @range = range

  end

  def guess

   puts "Range is : 1.. #{@range}"
    rand = Random.new
    @current_guess = rand(1..@range)
    result = @oracle.is_it?(@current_guess)
    if result == -1
      #@range = (@current_guess + @oracle.number)/2
      @range = @current_guess-1
    end
    result
  end
end

class GuessIt

  def initialize

    @oracle = Oracle.new(100)
    @random_player = RandomPlayer.new("John", @oracle, 100)
    @smart_player = SmartPlayer.new("Aoife", @oracle, 100)

  end

  def play

    puts "Oracle's winning number is #{@oracle.number}."
    puts "Let the games begin!"
    correct = false

    while not (correct == 0)
      correct = @random_player.guess
      puts "#{@random_player.name} guessed #{@random_player.current_guess}"
    end
    puts "#{@random_player.name} guessed #{@random_player.current_guess} and won!"


    puts "It's #{@smart_player.name}'s turn:"

    puts "Oracle's winning number is #{@oracle.number}."
    puts "Let the games begin!"
    correct = false

    while not (correct == 0)
      correct = @smart_player.guess
      puts "#{@smart_player.name} guessed #{@smart_player.current_guess}"
    end
    puts "#{@smart_player.name} guessed #{@smart_player.current_guess} and won!"

  end
end

game = GuessIt.new
game.play

