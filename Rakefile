# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

# Install the Rubocop Rake task so the CI server can call it without installing Rubocop globally
require 'rubocop/rake_task'

require_relative 'config/application'

# By default rails test runs minitest.
# We want rspec, so we must clear the default definition
# Rake::Task['test'].clear

RuboCop::RakeTask.new

Rails.application.load_tasks
