class CreateCharacter 
 
  attr_accessor :character
  
  def initializer
    @character = Character.new
    self.get_name
    self.get_race
    self.get_class
    self.start_stats
    #Im still trying to figure out how to
    #create an object from the character class
    #whithin a method from this instance
  end

  def stat_roll
    Dice.stat_roll
  end

  def start_stats
    while @character.stats.values.any?(nil)
      puts "Ready to roll?"
      roll = stat_roll
      puts "You rolled #{roll}!"
      puts "What stat do you want to set for #{roll}?"
      input = gets.strip.downcase.to_sym
      @character.stats[input] = roll
    end
  end
  
end

#   def get_name 
#     puts 'What is your name?'
#     self.name = gets.chomp
#   end

#   def get_race
#     puts 'what is your race?' 
#     self.race = gets.chomp 
#   end

#   def get_class
#     puts 'what is your class?'
#     self.class = gets.chomp
#   end
  
#   def self.roll_stats
#     @initial_stats = {
#       :hp => 100,
#       :str => Dice.stat_roll,
#       :dex => Dice.stat_roll,
#       :con => Dice.stat_roll,
#       :wis => Dice.stat_roll,
#       :int => Dice.stat_roll,
#       :cha => Dice.stat_roll
#     }
#   end

#  # def add_class_stat_bonus
#  #   self.initial_stats.map {|stat}  
#  # end