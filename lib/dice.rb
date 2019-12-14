class Dice
  
  @@list = []

  attr_accessor :sides, :count, :name
  
  def initialize(sides, count=1) 
    @sides = sides 
    @count = count
    @name = "#{count}d#{sides}" #ex. '2d4'
    @@list << self
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
