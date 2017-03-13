require 'rubygems'

begin
  require 'cucumber'
  require 'cucumber/rake/task'

  namespace :cucumber do
    Cucumber::Rake::Task.new(:html) do |t|
      path = 'reports/feature/results'
      mkdir_p(path) unless File.exist?(path)
      t.profile = 'html_report'
    end
  end

rescue LoadError
  desc 'Cucumber rake task not available'
end
