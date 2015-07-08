require_relative 'rubytree'

RSpec.describe Tree do
  sarah = Tree::TreeNode.new("Sarah")
  brian = Tree::TreeNode.new("Brian")
  ryan = Tree::TreeNode.new("Ryan")
  ryan << sarah
  sarah << brian

  describe '#grandparent' do
    it 'returns grand parent of the node' do
      expect(grandparent(brian)).to eq("Ryan")
    end
    it 'raises error when there is no grandparent to the node' do
      expect{ grandparent(nancy) }.to raise_error
    end
  end #describe grandparent

end