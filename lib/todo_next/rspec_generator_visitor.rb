require File.dirname(__FILE__) + '/tree/depth_first_visitor_base'

module TodoNext

  class RspecGeneratorVisitor < TodoNext::Tree::DepthFirstVisitorBase
    def visit(curr_node, level) #nodoc#
      super
    end

    def process_terminal_node(curr_node, level)
      tabs = '  '*(level-1)
      code = %Q|#{tabs}it("#{curr_node.text}", :pending => "#{curr_node.text}"){}|
    end

    def process_non_terminal_node(curr_node, level)
      tabs = '  '*(level-1)
      codes = curr_node.children.collect { |node| visit(node, 1+level) }
      [%Q|#{tabs}describe "#{curr_node.text}" do|] + codes + ["#{tabs}end"]
    end
  end

end