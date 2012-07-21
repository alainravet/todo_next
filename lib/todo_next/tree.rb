require File.dirname(__FILE__) + '/tree/factory'
require File.dirname(__FILE__) + '/tree/example_remover_visitor'
require File.dirname(__FILE__) + '/tree/leaf_maker_visitor'

module TodoNext

  class Tree
    attr_accessor :children

    def initialize
      @children = []
    end

    def visit(visitor)
      result = []
      children.each do |node|
        result << visitor.visit(node, level=1, parent=self)
      end
      result
    end

    def prune_examples
      visit(ExampleRemoverVisitor.new)
      visit(LeafMakerVisitor     .new)
      self
    end
  end

end