class Paladin < Character

  def stat_bonus
    self.stats[:cha] += 2
  end

  def minor_heal(character)
    character.stats[:hp] += Dice.roll(8)
  end

end
