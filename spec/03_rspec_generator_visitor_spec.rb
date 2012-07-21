require 'spec_helper'

describe TodoNext::Tree::Visitor::RspecGenerator do

  it 'visits the tree depth-first' do
    source = 'HEADER 1'            + "\n" +
        '  HEADER 2'          + "\n" +
        '    HEADER 3'        + "\n" +
        '      spec a'        + "\n" +
        '      spec b'        + "\n" +
        'HEADER 4'            + "\n" +
        '  spec c'            + "\n" +
        'HEADER 5'            + "\n" +
        'HEADER 6'

    expected =<<RUBY.chomp
describe "HEADER 1" do
  describe "HEADER 2" do
    describe "HEADER 3" do
      it("spec a", :pending => "spec a"){}
      it("spec b", :pending => "spec b"){}
    end
  end
end
describe "HEADER 4" do
  it("spec c", :pending => "spec c"){}
end
it("HEADER 5", :pending => "HEADER 5"){}
it("HEADER 6", :pending => "HEADER 6"){}
RUBY

    TodoNext(source).should == expected
  end
end