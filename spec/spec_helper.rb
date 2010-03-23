lib_path = File.expand_path(File.dirname(__FILE__) + "/../lib")
$LOAD_PATH.unshift lib_path unless $LOAD_PATH.include?(lib_path)

require 'rubygems'
gem "actionpack", '~> 2.3'
require 'action_controller'

gem "rspec-core", "~> 2.0.0.beta"
require 'rspec/core'
require 'rspec-rails23'

gem "mocha"

module Rspec
  module Core
    module Matchers
      def fail
        raise_error(::Rspec::Expectations::ExpectationNotMetError)
      end

      def fail_with(message)
        raise_error(::Rspec::Expectations::ExpectationNotMetError, message)
      end
    end
  end
end

def remove_last_describe_from_world
  Rspec::Core.world.example_groups.pop
end

class DummyFormatter < Rspec::Core::Formatters::BaseTextFormatter; end

def dummy_reporter
  DummyFormatter.new({}, StringIO.new)
end

def use_color?
  !ENV.has_key?('TM_MODE')
end

Rspec.configure do |config|
  config.mock_with :mocha
  config.color_enabled = use_color?
  config.formatter = :documentation
  config.filter_run :focused => true
  config.run_all_when_everything_filtered = true
end
