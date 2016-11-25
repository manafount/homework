require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: "Stephanie") }
  let(:prettycake) { Dessert.new("pretty cake", 5, chef) }

  describe "#initialize" do
    it "sets a type" do
      expect(prettycake.type).to eq("pretty cake")
    end
    it "sets a quantity" do
      expect(prettycake.quantity).to eq(5)
    end
    it "starts ingredients as an empty array" do
      expect(prettycake.ingredients).to eq([])
    end
    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("pie", "SO MUCH", chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      prettycake.add_ingredient("candy")
      expect(prettycake.ingredients).to eq(["candy"])
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      prettycake.add_ingredient("rainbows")
      prettycake.add_ingredient("flowers")
      prettycake.add_ingredient("a child's laughter")
      prettycake.add_ingredient("moonbeams")
      prettycake.add_ingredient("unicorn farts")
      prettycake.mix!
      expect(prettycake.ingredients).to_not eq(prettycake.ingredients.sort)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      prettycake.eat(1)
      expect(prettycake.quantity).to eq(4)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { prettycake.eat(12) }.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Stephanie the Great Baker")
      expect(prettycake.serve).to eq("Chef Stephanie the Great Baker has made 5 pretty cakes!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(prettycake)
      prettycake.make_more
    end
  end
end
