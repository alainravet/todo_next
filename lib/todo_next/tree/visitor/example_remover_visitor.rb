require File.dirname(__FILE__) + '/base'

module TodoNext::Tree::Visitor
  class ExampleNodesRemover < Base

    def visit(curr_node, level, parent) #nodoc#
      if curr_node.example?
        remove_from_tree(curr_node)
      elsif curr_node.has_children?
        visit_children_of(curr_node, level)
      end
    end

  private

    def remove_from_tree(curr_node)
      curr_node.remove_from_parent_children
    end

  end
end