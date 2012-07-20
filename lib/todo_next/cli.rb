require File.dirname(__FILE__) + '/cli/sample_file_generator'

module TodoNext

  class CLI
    def self.run(argv)
      SampleFileGenerator.generate(object_name = argv.shift)
    end
  end

end
