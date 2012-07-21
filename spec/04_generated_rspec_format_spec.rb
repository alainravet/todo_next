require 'spec_helper'

describe TodoNext::RspecGeneratorVisitor, 'fine-tuning' do

  it 'visits the tree depth-first' do
    source =  'HEADER 1'                    + "\n" +
              '  HEADER 2'                  + "\n" +
              '    - HEADER 3'              + "\n" +
              '      √ spec a'              + "\n" +
              '      * spec b'              + "\n" +
              '      - spec c'

    expected =<<RUBY.chomp
describe "HEADER 1" do
  describe "HEADER 2" do
    describe "HEADER 3" do
      it("* spec b", :pending => "* spec b"){}
      it("spec c", :pending => "spec c"){}
    end
  end
end
RUBY

    TodoNext(source).should == expected
  end
end