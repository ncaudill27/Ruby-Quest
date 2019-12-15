require_relative 'spec_helper'

describe Dice do
  before :each do
    @dice = Dice.new(8, 2)
  end

  describe "@@list" do
    it "has a class variable, @@list, that points to an array" do
      expect(Dice.class_variable_get(:@@list)).to be_a(Array)
    end
  end
  
end