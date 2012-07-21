require File.dirname(__FILE__) + '/tree/factory'
require File.dirname(__FILE__) + '/tree/visitor/example_remover_visitor'
require File.dirname(__FILE__) + '/tree/visitor/rspec_generator'
require File.dirname(__FILE__) + '/tree/visitor/leaf_maker'

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

    def to_rspec
      visit(TodoNext::Tree::Visitor::RspecGenerator.new).flatten.join("\n")
    end

  end
end