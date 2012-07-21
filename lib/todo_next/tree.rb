require File.dirname(__FILE__) + '/tree/factory'

module TodoNext

  class Tree
    attr_accessor :children

    def initialize
      @children = []
    end

    def visit(visitor)
      children.collect do |node|
        visitor.visit(node, level=1, parent=self)
      end
    end
  end

end