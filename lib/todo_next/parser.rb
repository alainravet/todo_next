require File.dirname(__FILE__) + '/tree'
require File.dirname(__FILE__) + '/line'
require File.dirname(__FILE__) + '/cli'

module TodoNext
  class Parser

    def self.parse(text, prune_example_nodes=true)
      lines = extract_meaningful_lines(text)
      tree  = Tree::Factory.build(lines)
      if prune_example_nodes
        tree.visit(TodoNext::Tree::Visitor::ExampleNodesRemover.new)
        tree.visit(TodoNext::Tree::Visitor::LeafMaker          .new)
      end
      tree
    end

    def self.extract_meaningful_lines(text)
       text.
           split("\n").
           collect do |text|
         col_offset = text =~ /\S/
         Line.new(text.strip, col_offset)
       end.
           reject{|l| l.blank?  }.
           reject{|l| l.comment?}.
           reject{|l| l.passed?}
    end

  end
end