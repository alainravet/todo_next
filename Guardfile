# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'rspec', :cli => "--color --format nested --fail-fast" do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})  { "spec" }
  watch('spec/spec_helper.rb')
end