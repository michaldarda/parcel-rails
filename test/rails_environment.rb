$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

ENV["RAILS_ENV"] ||= 'test'

require 'rubygems'

begin
  require "bundler/inline"
rescue LoadError => e
  $stderr.puts "Bundler version 1.10 or later is required. Please update your Bundler"
  raise e
end

gemfile(true) do
  source "https://rubygems.org"

  git_source(:github) { |repo| "https://github.com/#{repo}.git" }

  gem 'actionpack', '>= 3.0.0'
  gem 'activesupport', '>= 3.0.0'
  gem 'activemodel', '>= 3.0.0'
  gem 'railties', '>= 3.0.0'

  gem 'pry'
end

# Only the parts of rails we want to use
# if you want everything, use "rails/all"
require "action_controller/railtie"
require "rails/test_unit/railtie"

root = File.expand_path(File.dirname(__FILE__))

# Define the application and configuration
module Config
  class Application < ::Rails::Application
    config.eager_load = true
  end
end

# Initialize the application
Config::Application.initialize!

require 'parcel-rails'
