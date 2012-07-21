require File.dirname(__FILE__) + '/depth_first_visitor_base'

module TodoNext
  class Tree

    class LeafMakerVisitor < TodoNext::Tree::DepthFirstVisitorBase

      def process_terminal_node(curr_node, level, parent)
        puts "process_terminal_node(#{curr_node.text.inspect}, #{level}, ..)"
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
end