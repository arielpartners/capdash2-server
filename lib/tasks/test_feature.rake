require 'rubygems'

begin
  require 'cucumber'
  require 'cucumber/rake/task'

  Cucumber::Rake::Task.new(:test_feature) do |t|
    path = 'reports/feature'
    mkdir_p(path) unless File.exist?(path)
    t.profile = 'html_report'
  end

rescue LoadError
  desc 'Cucumber Rake task not available'
end
