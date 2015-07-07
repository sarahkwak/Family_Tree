require_relative 'family_tree'

RSpec.describe Tree do
    # creating family member objects
    nancy = Tree::Family.new("Nancy")
    adam = Tree::Family.new("Adam")
    jill = Tree::Family.new("Jill")
    carl = Tree::Family.new("Carl")
    kevin = Tree::Family.new("Kevin")
    catherine = Tree::Family.new("Catherine")
    joseph = Tree::Family.new("Joseph")
    samuel = Tree::Family.new("Samuel")
    george = Tree::Family.new("George")
    james = Tree::Family.new("James")
    aaron = Tree::Family.new("Aaron")
    patrick = Tree::Family.new("Patrick")
    robert = Tree::Family.new("Robert")
    mary = Tree::Family.new("Mary")

    # build relationship
    nancy.add(adam)
    nancy.add(jill)
    nancy.add(carl)
    jill.add(kevin)
    carl.add(catherine)
    carl.add(joseph)
    kevin.add(samuel)
    kevin.add(george)
    kevin.add(james)
    kevin.add(aaron)
    george.add(patrick)
    george.add(robert)
    james.add(mary)
  describe '#grand_parent_name' do
    it "should have at least one argument" do
      expect(grand_parent_name).to raise_error(NameError)
    end
    it "returns grand parent's name" do
      expect(patrick.grand_parent_name).to eq("Kevin")
    end
    it "should raise argument error if there is no grandparent" do
      expect(jill.grand_parent_name).to raise_error(ArgumentError)
    end
    it "should raise argument error if the instance is root object" do
      expect(nancy.grand_parent_name).to raise_error(ArgumentError)
    end
  end

end