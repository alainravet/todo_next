require 'spec_helper'

describe TodoNext::Parser, 'parsing indented text and producing a Tree' do

  it 'ignores comments and blank lines' do
    @source = '# a comment'     + "\n" +
              '   # a comment'  + "\n" +
              '   '             + "\n" +
              ''
    result_should_be []
  end

  it 'converts a single line into a free :li element' do
    @source =  'HEADER 1'            + "\n"

    result_should_be [{:type => :li , :text => "HEADER 1"}]
  end

  it 'converts 2 lines starting in col 0 into 2 free :li elements' do
    @source = 'HEADER 1'            + "\n" +
              'HEADER 2'            + "\n"

    result_should_be [   {:type => :li , :text => "HEADER 1"},
                         {:type => :li , :text => "HEADER 2"}
                     ]
  end

  it 'converts 2 lines under a header as 2 :li under 1 :ol' do
    @source = 'HEADER 1'            + "\n" +
              '  spec a'            + "\n" +
              '  spec b'

    result_should_be [  {:type  => :ol , :text  => "HEADER 1",
                         :children  => [
                             {:type  => :li, :text  => "spec a"},
                             {:type  => :li, :text  => "spec b"}
                         ]
                        }
                    ]
  end

  it 'converts a complex text into the proper Tree' do
    @source = 'HEADER 1'            + "\n" +
              '  HEADER 2'          + "\n" +
              '    HEADER 3'        + "\n" +
              '      spec a'        + "\n" +
              'HEADER 4'            + "\n" +
              '  spec b'            + "\n"

    result_should_be [  {:type      =>  :ol, :text => "HEADER 1",
                         :children  => [
                             {:type     => :ol, :text => "HEADER 2",
                              :children => [
                                  {:type      =>:ol, :text => "HEADER 3",
                                   :children  =>[ {:type => :li, :text => "spec a"} ]
                                  }
                              ]
                             }
                         ]
                        },

                        {:type      =>  :ol, :text =>  "HEADER 4",
                         :children  =>  [
                             {:type      =>  :li, :text=>"spec b"}
                         ]
                        }
                    ]
  end
end
