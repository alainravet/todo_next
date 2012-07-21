module TodoNext
  class Tree
    class Node

      attr_accessor :text, :parent, :children
      def initialize(text, parent=nil)
        @text, @parent = text, parent
        @children = []
      end

      def terminal? ; false end
      def example?  ; false end

      def has_children?
        !children.empty?
      end

      def remove_from_parent_children
        parent.children.delete_if do |child|
          child==self
        end
      end

      def make_me_a_leaf
        me_as_leaf = Tree::LI.new(text, parent)
        idx =  parent.children.find_index(self)
        parent.children[idx] = me_as_leaf
      end

    end
  end
end
