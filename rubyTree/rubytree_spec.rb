require_relative 'rubytree'

RSpec.describe Tree do
  sarah = Tree::TreeNode.new("Sarah")
  brian = Tree::TreeNode.new("Brian")
  ryan = Tree::TreeNode.new("Ryan")
  ryan << sarah
  sarah << brian
end