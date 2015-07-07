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

  end #class ends

end #module ends
