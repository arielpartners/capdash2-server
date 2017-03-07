require 'rubygems'

begin
  require 'cucumber'
  require 'cucumber/rake/task'

  namespace :cucumber do
    Cucumber::Rake::Task.new(:html) do |t|
      path = 'reports/feature/results'
      FileUtils::mkdir_p(path) unless File.exists?(path)
      t.profile = 'html_report'
    end
  end

rescue LoadError
  desc 'Cucumber rake task not available'
end
