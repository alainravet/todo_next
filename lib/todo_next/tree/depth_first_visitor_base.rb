module TodoNext
  class Tree

    class DepthFirstVisitorBase

      def visit(curr_node, level, parent) #nodoc#
        if curr_node.terminal?
          process_terminal_node(curr_node, level, parent)
        else
          process_non_terminal_node(curr_node, level, parent)
        end
      end

      def visit_children_of(parent, parent_level)
        parent.children.each do |node|
          visit(node, 1+parent_level, parent)
        end
      end

      # overwrite in the concrete visitor class
      def process_terminal_node(curr_node, level, parent)
      end

      # overwrite in the concrete visitor class
      def process_non_terminal_node(curr_node, level, parent)
      end
    end

  end
end