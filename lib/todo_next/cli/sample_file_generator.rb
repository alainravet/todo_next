require 'erb'

module TodoNext
  class CLI
    class SampleFileGenerator

      TEMPLATE_PATH     = File.dirname(__FILE__) + '/assets/rspec_example_file.rb.erb'

      def self.generate(object_name)
        object_name = object_name && object_name.downcase
        target_file = sample_file_path(object_name)
        if File.exist?(target_file)
          puts "skipping : the target file already exists (#{target_file})"
        else
          puts "#{target_file} was created."
          erb = ERB.new(File.read(TEMPLATE_PATH))
          classname = (object_name || 'foobar').capitalize  # for ERB/binding
          File.open(target_file,'w') do |f| f.write(erb.result(binding)) end
        end
      end

    private

      def self.sample_file_path(object_name)
        file_name = object_name ?
            "#{object_name}_spec.rb" :
            'todo_next_spec.rb'
        "#{sample_file_dir}/#{file_name}"
      end

      def self.sample_file_dir
        curr_dir  = `pwd`.chomp
        candidate = "#{curr_dir}/spec"
        File.directory?(candidate) ? candidate : curr_dir
      end

    end
  end
end
