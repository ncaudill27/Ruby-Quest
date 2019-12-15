class Dice

  attr_accessor :sides, :count
  
  def initialize(sides, count=1) 
    @sides = sides 
    @count = count
  end
  
  def name
    @name = "#{count}d#{sides}" #ex. '2d4'
  end

  def roll
    total = 0
    @count.times do
      total += rand(1..@sides)
    end
    total
  end

  def self.stat_roll
    roll4d6 = [rand(1..6), rand(1..6),  rand(1..6), rand(1..6)]
    roll4d6.sum - roll4d6.min # Discard lowest roll
  end
  
end
