require_relative 'spec_helper'

describe CreateCharacter do
  creator = CreateCharacter.new

  describe "#initialize" do
    it "creates a new instances of Character" do
      expect(creator.character).to be_an_instance_of(Character)
    end
  end
  
  describe "#stat_roll" do
    it "returns a d20 roll" do
      roll = creator.stat_roll
      
      expect(roll).to be_between(1,20)
    end
  end
  describe "#set_stat" do
    it "can assign to one stat at a time" do
      creator.set_stat(12)

      expect(creator.character.stats.values).to include(12)
    end
  end
  describe "#set_stats" do
    it "rolls and sets core stats" do
      creator.character.stats = {
        str:1, spd:1, con:1, wis:1, int:1, cha:1
       }
       
       expect(creator.character.stats.values).not_to be(nil)
    end
  end

end
