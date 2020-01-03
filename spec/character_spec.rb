require_relative 'spec_helper'

describe Character do
  goblin = Paladin.new
  goblin.name = "Krush"
  goblin.race = "Goblin" #?Race Module?
  goblin.klass = "Paladin"
  goblin.weapon = Weapon.new("Sword", Dice.new(1))
  #TODO Figure how hp, ac, and modifier will be set.

  describe "Attributes:" do
    #TODO Add class Race and Klass to character.
    it "has name, race, and klass" do
    
      #TODO Figure out expectations. See above
    end
  

    it "has a hash" do
      hero = Character.new
      expect(hero.stats).to be_a(Hash)
      expect(hero.stats.keys).to include(:str,:dex,:con,:wis,:int,:cha)
    end

    # it "tracks if character is alive" do
      #TODO Add a dead/dying functionality when.hpat 0      
    # end

    it "has an inventory hash" do 
      expect(goblin.inventory).to be_a(Hash)
    end

    it "has a weapon" do
      expect(goblin.weapon).to be_a(Weapon)
    end
  end

  describe "Actions:" do
    badman = Character.new
    badman.name = "BadMan"
    badman.weapon = Weapon.new("Knife", Dice.new(4))
    badman.hp = 50
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
        expect{goblin.use_item(buff, 11)}.to output("Krush doesn't have any more Buff\n").to_stdout
        expect(goblin.inventory[buff]).to eq(8)
      end
    end

    describe "#attack_check" do

      it "returns 'hit' on success" do
        badman.ac = 1

        expect(goblin.attack_check(badman)).to eq('hit')
      end
      it "has 'miss' on failure" do
        badman.ac = 30

        expect(goblin.attack_check(badman)).to eq('miss')
      end
      it "returns 'critical' on natural 20" do
      end
    end

    describe "#attack" do
      
      it "responds to hit" do
        badman.ac = 1

        expect{goblin.attack(badman)}.to output("Krush hit BadMan for 1!\n").to_stdout
        expect(badman.hp).to eq(49)
      end
      it "responds to critical" do
        # let(attack_check(badman)).to
        expect{goblin.attack(badman)}.to output("CRITICAL!! Krush inflicted 1 damage!!\n").to_stdout
      end
      it "responds to miss" do
        badman.ac = 30

        expect{goblin.attack(badman)}.to output("Krush missed!\n").to_stdout
      end
    end
  end

  




end