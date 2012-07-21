require 'spec_helper'

describe TodoNext::Tree do

  describe '#prune_examples' do

    specify 'an top-level example line with a sibling is removed' do
      source = 'spec 1'                 + "\n" +
               'example : ignore me'    + "\n" +
               'spec 2'
      tree = TodoNext::Parser.parse(source)
      tree.to_hash[:children].should ==
                [  {:type  => :li, :text  => 'spec 1'             },
                   {:type  => :ex, :text  => 'example : ignore me', :children => []},
                   {:type  => :li, :text  => 'spec 2'             }
                ]
      tree.prune_examples.to_hash[:children].should ==
                [  {:type  => :li, :text  => 'spec 1', },
                   {:type  => :li, :text  => 'spec 2'}
                ]
    end

    specify 'an sb-level example line with a sibling is removed'


    specify 'an example block is removed' do
      source = 'HEADER 1'            + "\n" +
                '  ex :'              + "\n" +
                '    blabla'          + "\n" +
                '  spec b'

      tree = TodoNext::Parser.parse(source)
      tree.prune_examples.to_hash[:children].should ==
                [  {:type     => :ol , :text  => "HEADER 1",
                    :children => [{:type => :li, :text => "spec b"}]
                   }
                 ]
    end

    specify 'when an OL only child is an EX, it becomes a LI after pruning' do
      source = 'spec 1'               + "\n" +
                '  ex :'              + "\n" +
                '    blabla'

      tree = TodoNext::Parser.parse(source)
      tree.prune_examples.to_hash[:children].should ==
                [  {:type     => :li , :text  => "spec 1"}
                ]
    end

  end
end