require 'tree'

# Root node
nancy = Tree::TreeNode.new("Nancy", "Root Content")
root_node = nancy

# Children of Nancy
adam = Tree::TreeNode.new("Adam", "Child1 Content")
jill = Tree::TreeNode.new("Jill", "Child2 Content")
carl = Tree::TreeNode.new("Carl", "Child3 Content")

# Children of Jill
kevin = Tree::TreeNode.new("Kevin", "Child1 Content")

# Children of Carl
catherine = Tree::TreeNode.new("Catherine", "Child1 Content")
joseph = Tree::TreeNode.new("Joseph", "Child2 Content")

# Children of Kevin
samuel = Tree::TreeNode.new("Samuel", "Child1 Content")
george = Tree::TreeNode.new("George", "Child2 Content")
james = Tree::TreeNode.new("James", "Child3 Content")
aaron = Tree::TreeNode.new("Aaron", "Child4 Content")

# Children of George
patrick = Tree::TreeNode.new("Patrick", "Child1 Content")
robert = Tree::TreeNode.new("Robert", "Child2 Content")

# Children of James
mary = Tree::TreeNode.new("Mary", "Child1 Content")

# Tree Structure
root_node << adam
root_node << jill
root_node << carl
carl << catherine
jill << kevin
carl << joseph
kevin << samuel
kevin << george
kevin << james
kevin << aaron
george << patrick
george << robert
james << mary
