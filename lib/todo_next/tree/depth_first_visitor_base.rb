module TodoNext
  class Tree

    class DepthFirstVisitorBase

      def visit(curr_node, level) #nodoc#
        if curr_node.terminal?
          process_terminal_node(curr_node, level)
        else
          process_non_terminal_node(curr_node, level)
        end
      end

      # overwrite in the concrete visitor class
      def process_terminal_node(curr_node, level)
      end

      # overwrite in the concrete visitor class
      def process_non_terminal_node(curr_node, level)
      end
    end

  end
end