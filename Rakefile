require 'rubygems'
require 'bundler/setup'
require 'rspec/core'
require 'rspec/core/rake_task'
require 'rack'

RSpec::Core::RakeTask.new do |t|
  t.pattern = "./spec/**/*_spec.rb"
  # t.ruby_opts = "-w"
end

task :default => :spec