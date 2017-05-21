#
# Test is run automatically by the CI server for pull requests and post-merge
# The idea is to run static analysis and all the automated tests and generate
# the reports, one stop shopping for tests.
# As additional types of automated tests are added, we should add them here.
#
# Caveat: we need PR builds to be quick, so this script may omit longer-running tests.
#
task :test do
  puts 'Executing Static Analysis'
  Rake::Task['rubocop'].execute

  puts 'Executing unit tests'
  Rake::Task['unit_tests'].execute
end