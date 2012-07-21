require File.dirname(__FILE__) + '/node'
require File.dirname(__FILE__) + '/nodes'
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

          new_node = if     line.example? then Tree::EX.new(line.text, parent)
                     elsif  line.branch?  then Tree::OL.new(line.text, parent)
                     else                      Tree::LI.new(line.text, parent)
                     end
          parent.children << new_node

          if line.branch?
            parents.register_parent(new_node, :for_col => curr_line_col)
          end
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