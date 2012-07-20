module GoalTDD

  class Tree
    class Node
      attr_accessor :text, :parent, :children
      def initialize(text, parent=nil)
        @text, @parent = text, parent
        @children = []
      end

      def terminal?
        false
      end
    end

    class OL < Node ; end

    class LI < Node
      def terminal?
        true
      end
    end
  end

end