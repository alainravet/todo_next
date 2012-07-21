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