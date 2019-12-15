class Dice
  
  @@list = []

  attr_accessor :sides, :count
  
  def initialize(sides, count=1) 
    @sides = sides 
    @count = count
    @@list << self
  end
  
  def name
    @name = "#{count}d#{sides}" #ex. '2d4'
  end
  
  def self.list #lists all instances of Dice class.
    @@list
  end

  def roll
    total = @count * @sides 
    rand(1..total)
  end

  def self.stat_roll
    roll4d6 = [rand(1..6), rand(1..6),  rand(1..6), rand(1..6)]
    roll4d6.sum - roll4d6.min # Discard lowest roll
  end
  
end
