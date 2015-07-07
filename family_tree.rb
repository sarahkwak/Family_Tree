module Tree

  class Family
    attr :name, :children, :parent
    def initialize(name)
      @name = name
      # @child_hash = Hash.new
      @children = []
    end

    def root
      root = self
      root = root.parent while !root.is_root?
      root
    end

    def is_root?
      @parent.nil?
    end

    def parent=(parent)
      @parent = parent
    end

    def parentage
      return nil if is_root?
      parent_array = []
      grand_parent = self.parent
      parent_array
    end

    def <<(child)
      add(child)
    end

    def add(child)
      child.parent =self
      @children.push(child)
    end

    def grand_parent_name
      raise ArgumentError, 'There is no Grand Parent' if self.parent === nil or self.parent.parent == nil
      return parent.parent.name
    end

    def siblings
      if @parent.child.size === 0
        return 0
      end
      @parent.child.each { |each_child| p each_child.name }
    end

    def is_leaf?
      @children.size == 0
    end

    def is_root?
      @parent == nil
    end

    def grand_children
      grand_children = []
      @children.each do |child|
        child.children.each do |g_child|
          grand_children << g_child
        end
      end
      grand_children
    end

    def grand_children
      grand_children = []
      @children.each do |child|
        child.children.each do |g_child|
          grand_children << g_child
        end
      end
      grand_children
    end

  end #class ends

end #module ends


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

# No Sibling function (will return node)
def no_siblings(node, result=[])
  if node.is_root?
    result<<node
  end
  if node.children.size == 1
    result<<node.children[0]
  elsif node.is_leaf?
    return result
  end
  node.children.each do |child|
    no_siblings(child, result)
  end
  return result
end
# No Sibling function (will return name)
def no_siblings_name(node)
  result = no_siblings(node)
  result.each { |ind| p ind.name }
end

# No Children function (will return node)
def no_children(node, result=[])
  if node.is_root?
    result
  end
  if node.children.size == 0
    result << node
  elsif node.is_leaf?
    result << node
  elsif node.children.size == 1
    result
  end
  node.children.each do |child|
    no_children(child, result)
  end
  return result
end

# No Children function (will return name)
def no_children_name(node)
  result = no_children(node)
  result.each { |person| p person.name }
end

# General Tree seach function
def search(node, name)
  if node.name == name
    return node
  end
  node.children.each do |child|
    result = search(child, name)
    if result != nil
      return result
    end
  end
  return nil
end

# Largest Grand Children function (will return node)
def largest_grand_child(node, winner= nil)
  if node.is_root?
    winner = node
  end
  if !node.is_leaf?
    if node.grand_children.size > winner.grand_children.size
      winner = node
    end
    node.children.each do |child|
      winner = largest_grand_child(child, winner)
    end
  end
  return winner
end

#  Largest Grand Children function (will return name)
def largest_grand_child_name(node)
  result = largest_grand_child(node)
  p result.name
end
# Drive Test goes here
# p jill.grand_parent_name
# no_siblings_name(nancy)
# nancy.grand_parent_name
# no_children_name(nancy)
# no_children(nancy)
# largest_grand_child_name(kevin)
# p jill.grand_children.count