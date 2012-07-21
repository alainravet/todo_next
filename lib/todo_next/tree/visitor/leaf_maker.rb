require File.dirname(__FILE__) + '/base'

module TodoNext::Tree::Visitor
  class LeafMaker < Base

    def process_terminal_node(curr_node, level, parent)
    end

    def process_non_terminal_node(curr_node, level, parent)
      if curr_node.has_children?
        visit_children_of(curr_node, level)
      else
        curr_node.make_me_a_leaf
      end
    end

  end
end