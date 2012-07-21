require File.dirname(__FILE__) + '/node'
require File.dirname(__FILE__) + '/parents_list'

module TodoNext

  class Tree
    class Factory

      def self.build(lines)
        mark_the_leaves_and_the_branches(lines)

        tree    = Tree.new
        parents = ParentsList.new

        lines.each do |line|
          curr_line_col = line.col_offset
          parent        = parents.get_for_item_at_column(curr_line_col) || tree

          if line.branch?
            new_node = Tree::OL.new(line.text, parent)
            parents.register_parent(new_node, :for_col => curr_line_col)
          else
            new_node = Tree::LI.new(line.text, parent)
          end
          parent.children << new_node
        end
        tree
      end

    private

      def self.mark_the_leaves_and_the_branches(lines)
        lines.each_with_index do |curr_line, idx|
          next_line          = lines[1+idx]
          next_line_is_child = next_line && curr_line.col_offset < next_line.col_offset
          curr_line.leaf     = !next_line_is_child
        end
      end

    end
  end

end