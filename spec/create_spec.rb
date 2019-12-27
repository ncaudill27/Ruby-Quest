require_relative 'spec_helper'

describe CreateCharacter do
  creator = CreateCharacter.new
  
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
    
  end

end
