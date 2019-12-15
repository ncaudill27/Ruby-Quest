require_relative 'spec_helper'

describe Character do
  goblin = Paladin.new
  goblin.name = "Krush"
  goblin.race = "Goblin" #?Race Module?
  goblin.klass = "Paladin"
  goblin.weapon = Weapon.new("Sword", Dice.new(10))

  describe "Attributes:" do
    #TODO Add class Race and Klass to character.
    it "has name, race, and klass" do
    
      #TODO Figure out expectations. See above
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

    describe "#add_item" do
      it "holds items" do
        expect(badman.inventory.keys).to include("Apple")
        expect(badman.inventory["Apple"]).to eq(1)
      end
      
      it "creates a slot if item doesn't exist" do
        badman.add_item("Gypsy Tear's", 5)
        
        expect(badman.inventory.keys).to include("Gypsy Tear's")
        expect(badman.inventory["Gypsy Tear's"]).to eq(5)
      end
    end

    describe "#use_item" do
      buff = Item.new({name: "Buff", dice: Dice.new(1), stat: :str})
      goblin.add_item(buff, 10)
      goblin.stats[:str] = 10
      
      it "affects the intended stat" do
        goblin.use_item(buff)

        expect(goblin.stats[:str]).to eq(11)
      end
      it "subtracts count from inventory" do
        goblin.use_item(buff)

        expect(goblin.inventory[buff]).to eq(8)
      end
      it "cannot use more than inventory count" do
        goblin.use_item(buff, 11){ expect { print("Krush doesn't have any more 'Buff'")}.to output.to_stdout }
        expect(goblin.inventory[buff]).to eq(8)
      end
    end
  


  end

end