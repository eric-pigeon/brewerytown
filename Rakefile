require 'rspec/core/rake_task'
require 'bundler/gem_tasks'

# Default directory to look in is `/specs`
# Run with `rake spec`
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = "spec/**/*_spec.rb"
end

task :default => :spec

