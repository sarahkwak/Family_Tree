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
  end #class ends

end #module ends
