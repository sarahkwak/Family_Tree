class Tree
  attr :parent, :children, :name
  attr_accessor :parent
  def initialize(name)
    @children = []
    @parent
    @name = name
  end

  def root
    root = self #if we refer the specific node to root
    root = root.parent
  end

  def search(node)
    if @name == node.name
      return self
    end
    @children.each do |child|
      child.search(child)
      if result != nil
        return result
      end
    end
    return nil
  end

  def add(father, node)
    node.parent = father
    father.children.push(node)
  end

  def grandparent(node)
    if node.parent == nil || node.parent.parent == nil
      return nil
    else
      return node.parent.parent.name
    end
  end

  def childless_people(loney_people=[])
    if @children.size == 0
      loney_people.push(self)
    end
    @children.each do |child|
      child.childless_people
    end
    loney_people.map { |person| p person.name}
  end

  def only_child(loney_people = [])
    if @parent == nil
      loney_people.push(self)
    elsif parent.children.size == 1
      loney_people.push(parent.children[0])
    end
      @children.each do |child|
        child.only_child
      end
    return loney_people.size
  end
end #Tree class

nancy = Tree.new("Nancy")
bob = Tree.new("Bob")
george = Tree.new("George")
ryan = Tree.new("Ryan")
brian = Tree.new("Brian")

nancy.add(nancy, bob)
nancy.add(bob, george)
nancy.add(bob, ryan)
nancy.add(ryan, brian)
# p nancy.grandparent(bob
  # p nancy.childless_people
  p nancy.only_child
  p bob.parent.children.size
  p bob.parent.children[0]