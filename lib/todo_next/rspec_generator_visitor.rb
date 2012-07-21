require File.dirname(__FILE__) + '/tree/depth_first_visitor_base'

module TodoNext

  class RspecGeneratorVisitor < TodoNext::Tree::DepthFirstVisitorBase
    def visit(curr_node, level) #nodoc#
      super
    end

    def process_terminal_node(curr_node, level)
      tabs  = '  '*(level-1)
      label = label(curr_node)
      code = %Q|#{tabs}it("#{label}", :pending => "#{label}"){}|
    end

    def process_non_terminal_node(curr_node, level)
      tabs = '  '*(level-1)
      codes = curr_node.children.collect { |node| visit(node, 1+level) }
      [%Q|#{tabs}describe "#{label(curr_node)}" do|] + codes + ["#{tabs}end"]
    end

    def label(node)
      text = node.text
      text.gsub! /^[-\+]\s*/,''
      text
    end
  end

end