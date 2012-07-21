require 'erb'

module TodoNext
  class CLI
    class SampleFileGenerator

      TEMPLATE_PATH     = File.dirname(__FILE__) + '/assets/rspec_example_file.rb.erb'

      def self.generate(object_name)
        object_name = object_name && object_name.downcase
        target_file = sample_file_path(object_name)

        erb = ERB.new(File.read(TEMPLATE_PATH))
        classname = (object_name || 'foobar').capitalize  # for ERB/binding
        rspec_sample = erb.result(binding)

        if File.exist?(target_file)
          File.open(target_file, "r") do |orig|
            @original = orig.read()
          end
          if @original.include?(rspec_sample)
            puts "skipping : sample code already present in #{target_file}."
          else
            File.open(target_file, "r") do |orig|
              File.unlink(target_file)
              File.open(target_file, "w") do |new|
                new.write rspec_sample
                new.write(@original)
              end
              puts "sample code was inserted in #{target_file}."
            end
          end
        else
          File.open(target_file,'w') do |f| f.write(rspec_sample) end
          puts "#{target_file} was created."
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
