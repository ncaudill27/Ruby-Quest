require_relative 'spec_helper'

describe Character do

  describe "Attributes:" do
    goblin = Paladin.new
    goblin.name = "Krush"
    goblin.race = "Goblin"
    goblin.klass = "Paladin"
    goblin.weapon = Weapon.new("Sword", Dice.new(10))
    
    it "has name, race, and klass" do
    
      #! Figure out expectations
    end
  

    it "has a stats hash" do
      hero = Character.new
      expect(hero.stats).to be_a(Hash)
      expect(hero.stats.keys).to include(:hp,:str,:dex,:con,:wis,:int,:cha,:modifier,:ac)
    end

    it "has an inventory hash" do 
      expect(goblin.inventory).to be_a(Hash)
      
    end

    it "has a weapon" do
      expect(goblin.weapon).to be_a(Weapon)
    end
  end

  describe "Actions:" do
    badman = Character.new
    badman.weapon = Weapon.new("Knife", Dice.new(4))
    badman.add_item("Apple", 1)

    describe "#use_item" do
      it "holds items" do
        expect(badman.inventory.keys).to include("Apple")
        expect(badman.inventory["Apple"]).to eq(1)
      end
    end
  


  end

end