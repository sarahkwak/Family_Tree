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

FAMILY = []
root_node.each { |node| FAMILY << node }

def grandparent(child)
  child.parent.parent.name
end

def no_siblings_name
  only_child = []
  i = 0
  while i < FAMILY.size
    if FAMILY[i].siblings == []
      only_child << FAMILY[i]
    end
    i+=1
  end
    only_child.each { |individual| p individual.name }
end

def no_children
  no_child = []
  i = 0
  while i < FAMILY.size
    if FAMILY[i].has_children? == false
      no_child << FAMILY[i]
    end
    i+=1
  end
  no_child.each { |individual| p individual.name }
end

def largest_grand_child
  i = 1
  largest_sibling = FAMILY[0]
  while i < FAMILY.size
    if FAMILY[i].siblings.count > largest_sibling.siblings.count
      largest_sibling = FAMILY[i]
    end
      i+=1
  end
     largest_children= largest_sibling.parent
     p largest_children.parent.name
end

root_node.print_tree