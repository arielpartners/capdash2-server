begin
  require 'brakeman'

  desc 'Run Brakeman'
  task :brakeman do
    Brakeman.run app_path: '.', print_report: true
  end
rescue LoadError
  desc 'brakeman not available'
end
