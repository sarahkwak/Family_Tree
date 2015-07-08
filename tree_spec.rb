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
    nancy.add(nancy, adam)
    nancy.add(nancy, jill)
    nancy.add(nancy, carl)
    nancy.add(jill, kevin)
    nancy.add(carl, catherine)
    nancy.add(carl, joseph)
    nancy.add(kevin, samuel)
    nancy.add(kevin, george)
    nancy.add(kevin, james)
    nancy.add(kevin, aaron)
    nancy.add(george, patrick)
    nancy.add(george, robert)
    nancy.add(james, mary)


  describe '#initialize' do
    it 'should have name' do
      expect{ sarah = Tree::Family.new }.to raise_error(ArgumentError)
    end

    let(:sarah) {Tree::Family.new("Sarah")}
    it 'should have name attribute' do
      expect(sarah).to have_attributes(:name => "Sarah")
    end
    it 'should have a children attribute' do
      expect(sarah).to have_attributes(:children => [])
    end
    it 'should be empty until children added to the variable' do
      expect(sarah.children.size).to eq(0)
    end
  end #describe initialize

  describe '#is_root?' do
    it 'checks if the node is the root node' do
      expect(nancy.is_root?).to be(true)
    end
    it 'confirms that the node does not have any parent' do
      expect(nancy.parent).to eq(nil)
    end
  end #describe is_root

   describe '#parentage' do
    it 'should return nil if argument is root node' do
      expect(nancy.parentage).to eq(nil)
    end
    it 'creates parent and child relationship' do
      expect(patrick.parent.name).to eq("George")
    end
  end #describe parentage

  describe '#add' do
    it 'should raise error if no argument passed' do
      expect{carl.add}.to raise_error(ArgumentError)
    end

    let(:brian) {Tree::Family.new("Brian")}
    let(:ryan) {Tree::Family.new("Ryan")}
    it 'should add children to the parent node' do
      nancy.add(ryan, brian)
      change{ryan.children.count}.from(0).to(1)
    end
      let(:joe) {Tree::Family.new("Ryan")}
    it 'raises error if the node name is already in the tree' do
      expect{ ryan.add(ryan, joe) }.to raise_error(ArgumentError)
    end
    it 'raises error when the node added to non-root node' do
      expect{ patrick.add(nancy, ryan) }.to raise_error(ArgumentError)
    end
  end #describe add

  describe '#grand_parent_name' do
    it "should have at least one argument" do
      expect{ grand_parent_name }.to raise_error
    end
    it "returns grand parent's name" do
      expect(patrick.grand_parent_name).to eq("Kevin")
    end
    it "should raise argument error if there is no grandparent" do
      expect{ jill.grand_parent_name }.to raise_error(ArgumentError)
    end
    it "should raise argument error if the instance is root object" do
      expect{ nancy.grand_parent_name }.to raise_error(ArgumentError)
    end
  end #describe for grand parent

  describe '#no_siblings' do
    it "should return people's name with no siblings" do
     expect(no_siblings(nancy).count).to eq(3)
   end
    it "should include leaf node" do
      expect(no_siblings(nancy)).to include(mary)
    end
    it "should include root node in this list" do
      expect(no_siblings(nancy)).to include(nancy)
    end
  end #describe for no siblings

  describe '#grand_children' do
    it 'should return grand children of the node' do
      expect(nancy.grand_children.size).to eq(3)
    end
    it "should NOT return anything if node has no grandchild" do
      expect(patrick.grand_children.size).to eq(0)
    end
  end #describe grand children

  describe '#no_children_name' do
    it 'should return people without children' do
      expect(no_children(nancy).count).to eq(8)
    end
    it 'should NOT include root node' do
      expect(no_children(nancy)).not_to include(nancy)
    end
    it 'should include leaf node' do
      expect(no_children(nancy)).to include(adam)
    end
    it 'should indicates that people in the list have no child' do
      expect(no_children(nancy)[0].children.count).to eq(0)
    end
  end #describe no children

  describe '#largest_grand_child' do
    it 'should raise error when the argument is not a root node' do
      expect{largest_grand_child(kevin)}.to raise_error(NoMethodError)
    end
    it 'should return person with most grandchildren' do
      expect(largest_grand_child(nancy)).to eq(jill)
    end
    it 'should have 4 grandchildren' do
      expect(largest_grand_child(nancy).grand_children.count).to eq(4)
    end
    it 'should not include root node in this list' do
      expect(largest_grand_child(nancy)).not_to eq(adam)
    end
  end #describe largest grand child

  describe '#siblings' do
    it 'should include root node' do
      expect(nancy.siblings).to eq(0)
    end
    it 'should return names of the siblings' do
      expect(george.siblings.count).to eq(3)
    end
    it 'should return "Only Child" if there is no sibling' do
      expect(kevin.siblings).to eq("Only Child")
    end
  end #describe siblings

  describe '#is_leaf?' do
    it 'checks if the node has any child' do
      expect(adam.is_leaf?).to be(true)
    end
    it 'checks if the node has any child' do
      expect(nancy.is_leaf?).to be(false)
    end
  end #describe is_leaf

  describe '#search' do
    it 'should return node object, when attribute name passed' do
      expect(nancy.search("Patrick")).to eq(patrick)
    end
    it 'may not find the object if the first argument is not the root node' do
      expect(patrick.search("Kevin")).to eq(nil)
    end
  end #describe search


end #rspec