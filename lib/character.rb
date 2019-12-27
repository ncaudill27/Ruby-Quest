class Character

  attr_accessor :name, :race, :klass, :stats, :inventory, :weapon
  

  def initialize
    @stats = {hp: nil, str: nil, dex: nil, con: nil, wis: nil, int: nil, cha: nil, modifier: nil, ac: nil}
    @inventory = {}
    @weapon = nil
  end

  def roll_stats
    {
      :hp => 100,
      :str => Dice.stat_roll,
      :dex => Dice.stat_roll,
      :con => Dice.stat_roll,
      :wis => Dice.stat_roll,
      :int => Dice.stat_roll,
      :cha => Dice.stat_roll,
      :modifier => 1, # Place holder so game won't break. Eventually will be set by Character's Class
      :ac => 1 # Will also be some math based off DEX/CON + equipment. According to Class specs
    }
    
  #def inital_stats <<< Stats are now calculated in the create character class. I've commented out so I don't break your merge. I'll fix it later
   # @stats = CreateCharacter.roll_stats 

  end

  def add_item(item, count = 1)
    if @inventory.include?(item)
      @inventory[item] += count
    else
      @inventory[item] = count
    end
  end

  def use_item(item, count = 1)
    if @inventory[item] == 0 || count > @inventory[item]
      puts "#{self.name} doesn't have any more #{item.name}"
    else
      self.stats[item.stat] += item.use
      @inventory[item] -= count
    end
  end

  def attack(enemy)
    dmg = @weapon.damage
    case attack_check(enemy)

    when 'hit'
      enemy.stats[:hp] -= dmg
      puts "#{self.name} hit #{enemy.name} for #{dmg}!"
    when 'critical'
      dmg *= 2 # Double dmg
      puts "CRITICAL!! #{self.name} inflicted #{dmg} damage!!"
    when 'miss'
      puts "#{self.name} missed!"
    end

  end

  def attack_check(enemy)
    self_check = Dice.new(20).roll + self.stats[:modifier]
    enemy_check = enemy.stats[:ac]

    if self_check > enemy_check
      return 'hit'
    elsif self_check == 20 + self.stats[:modifier] # Critical. Total needed for a natural 20
      return 'critical'
    else
      return 'miss'
    end
  end
end
