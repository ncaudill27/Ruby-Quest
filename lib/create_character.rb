class CreateCharacter 
 
  attr_accessor :character
  
  def initialize
    @character = Character.new
    # self.set_name
    # self.set_race
    # self.set_class
    # self.set_stats
    #Im still trying to figure out how to
    #create an object from the character class
    #whithin a method from this instance
  end

  def stat_roll
    Dice.stat_roll
  end

  def set_stat(number)
    puts "What stat do you want to set for #{number}?"
    input = gets.strip.downcase.to_sym
    character.stats[input] = number    
  end

  def set_stats
    while @character.stats.values.any?(nil)
      puts "Current stats:"
      print_stats
      roll = stat_roll
      puts "Your current roll is #{roll}."
      set_stat(roll)

    end
  end

  def print_stats
    character.stats.each do |key, val|
      puts "#{key.to_s.upcase}: #{val}"
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