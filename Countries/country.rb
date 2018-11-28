class Country
  include Comparable
  attr_reader :name,:population, :gold, :silver, :bronze

  def initialize (name, gold, silver, bronze, population)
    @name, @gold, @silver, @bronze, @population = name, gold, silver, bronze, population
  end

  def to_s
    "#{@name}, #{@gold}, #{@silver}, #{@bronze}, #{@population}"
  end

  def <=> other
    @gold <=> other.gold
  end

  def ranking
    (@gold*3 + @silver*2 + @bronze) / @population
  end

end

class MedalRankings

  attr_accessor :countries
  def initialize
    @countries = []
  end

  def to_s
    @countries.inject("") do |str, country|
      str += country.to_s + "\n"
    end
  end

  def add country
    @countries.push country
  end

  def most_golds
    @countries.sort!
    @countries[@countries.length-1]
  end

  def total_pop
    sum =0
    @countries.each do |country|
      sum+= country.population
    end
    sum
  end

  def sort!
    @countries.sort!{ |country1,country2| country1.ranking <=> country2.ranking}
  end

  def each_medal_winner
    @countries.each do |country|
      if country.gold > 0 || country.silver > 0 || country.bronze > 0
        yield country
      end
    end
  end

end

rankings = MedalRankings.new

File.open("medals.txt") do |file|
  file.each do |line|
    line = line.split
    country = line[0]
    gold = line[1].to_i
    silver = line[2].to_i
    bronze = line[3].to_i
    population = line[4].to_i
    rankings.add Country.new(country, gold, silver, bronze, population)
  end
end

puts rankings.to_s
puts "Most golds: #{rankings.most_golds.name}"
rankings.sort!
puts rankings.to_s

total_population = 0
count = 0
rankings.each_medal_winner do |x| total_population+=x.population
                                  count+=1
end
puts "Average population of countries that won a medal: #{total_population/count}"