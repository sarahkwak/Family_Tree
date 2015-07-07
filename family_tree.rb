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

  end #class ends

end #module ends
