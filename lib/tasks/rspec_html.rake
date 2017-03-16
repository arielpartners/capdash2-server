begin
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new(:spec) do |t|
    t.rspec_opts = '--format html --out reports/unit_tests/rspec_results.html'
  end
rescue LoadError
  desc 'rspec not available'
end
