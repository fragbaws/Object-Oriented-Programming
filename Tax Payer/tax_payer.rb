class TaxPayer

  include Comparable
  attr_reader :name,:salary, :tax_credit

  def initialize(name, salary, tax_credit)
    @name = name
    @salary = salary
    @tax_credit = tax_credit
  end

  def calculate_tax
    if @salary <= 34000
     tax = (@salary*0.2)-@tax_credit
    else
      first = 6800 #34000 * 0.2 (always the case)
      second = (@salary-34000) * 0.41
      tax = (first+second) - @tax_credit
    end

    tax < 0 ? 0.0 : tax
  end

  def to_s
    "Name: #{@name}, Tax Due: #{calculate_tax}"
  end

  def <=>(other)
    calculate_tax <=> other.calculate_tax
  end

end

class Population

  attr_accessor :taxpayers
  def initialize
    @taxpayers = []
  end

  def total_tax
    sum = 0
    @taxpayers.each do |taxpayer|
      sum += taxpayer.calculate_tax
    end
    sum
  end

  def no_tax
    count = 0
    @taxpayers.each do |taxpayer|
      if taxpayer.calculate_tax <=0.0
        count+=1
      else next
      end
    end

    ((count / @taxpayers.count.to_f)*100).round(2)
  end

  def sort!
    @taxpayers.sort!
  end

  def to_s
    @taxpayers.inject("") do |str, taxpayer|
      if (taxpayer.name == "Sean")
        str += taxpayer.to_s + " << Exile \n"
      else
      str += taxpayer.to_s + "\n"
      end
    end
  end
end

class TaxExile < TaxPayer

  def calculate_tax
    0.0
  end

end

population = Population.new
File.open("taxpayer.dat") do |f|
  f.each do |line|
    line = line.split
    name = line[0]
    salary = line[1].to_f
    tax_credit = line[2].to_f
    if name == "Sean"
      population.taxpayers << TaxExile.new(name, salary, tax_credit)
    else
      population.taxpayers << TaxPayer.new(name, salary, tax_credit)
    end
  end
end

population.sort!
puts population.to_s

