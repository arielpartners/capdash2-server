# SimpleCov configuration
# NOTE: remove filters if code is added to these folders
SimpleCov.start 'rails' do
  coverage_dir 'reports/feature/coverage'
  track_files 'app/**/*.rb'
  add_filter 'app/channels'
  add_filter 'app/mailers'
  add_filter 'app/jobs'
end
