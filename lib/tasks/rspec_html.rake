begin
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new(:unit_tests) do |t|
    t.rspec_opts = '--pattern test/unit/**/*_spec.rb --format documentation \
      --format html --out reports/unit/results/index.html'
  end
rescue LoadError
  desc 'rspec not available'
end
