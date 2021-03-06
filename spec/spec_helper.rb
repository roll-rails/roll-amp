require 'bundler/setup'
require 'roll/amp'
require 'simplecov'
require 'rspec-html-matchers'

SimpleCov.start do
  # Don't cover specs themselves.
  add_filter '/spec/'
end

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
  config.include RSpecHtmlMatchers
  config.before(:all) do
    @app_root = File.expand_path('./', File.dirname(__FILE__))
  end
end
