begin
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new(:test_unit) do |t|
    t.rspec_opts = '--format documentation \
      --format html --out reports/unit/results/index.html'
  end
rescue LoadError
  desc 'rspec Rake task not available'
end
