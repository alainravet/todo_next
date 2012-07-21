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
    end
  end
end

class TodoNext::Tree

  class OL < Node ; end

  class LI < Node
    def terminal? ; true  end
  end

  class EX < Node
    def example? ; true   end
    def terminal?; children.empty?  end
  end

end