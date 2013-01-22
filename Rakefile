require "bundler/gem_tasks"

$:.unshift File.expand_path('..', __FILE__)
require "tasks/release"

desc "Build gem files for all projects"
task :build => "all:build"

desc "Release all gems to gemcutter and create a tag"
task :release => "all:release"

desc 'Run all tests by default'
task :default => %w(test test:isolated)

task 'test' do
  true
end

task 'test:isolated' do
  true
end