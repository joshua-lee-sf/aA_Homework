require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef",  name: "Guy") }
  let(:cupcake) {Dessert.new("cake", 50, chef)}

  describe "#initialize" do
    it "sets a type" do
      expect(cupcake.type).to eq("cake")
    end


    it "sets a quantity" do
      expect(cupcake.quantity).to eq(50)
    end

    it "starts ingredients as an empty array" do
      expect(cupcake.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect {Dessert.new(:cupcake, "girl", "guy") }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      cupcake.add_ingredient("flour")
      expect(cupcake.ingredients).to include("flour")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients = ["flour", "egg", "water", "vanilla", "strawberries"]
      
      ingredients.each do |ingredient|
        cupcake.add_ingredient(ingredient)
      end
      
      expect(cupcake.ingredients).to eq(ingredients)
      cupcake.mix!
      expect(cupcake.ingredients).to_not eq(ingredients)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      cupcake.eat(5)
      expect(cupcake.quantity).to eq(45)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect{ cupcake.eat(500) }.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Guy the Great Baker")
      expect(cupcake.serve).to eq("Chef Guy the Great Baker has made 50 cakes!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(cupcake)
      cupcake.make_more
    end
  end
end