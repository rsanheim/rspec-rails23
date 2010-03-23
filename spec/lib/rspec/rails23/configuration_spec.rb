require File.expand_path(File.dirname(__FILE__) + "/../../../spec_helper")

describe Rspec::Core::Configuration do

  example "loading rspec rails23 includes it in the configuration class" do
    Rspec::Core::Configuration.included_modules.should include(Rspec::Rails23::Configuration)
  end
  
  it "adds a #rails method" do
    Rspec::Core::Configuration.new.should respond_to(:rails)
  end
  
  it "adds an #enable_active_record_transactional_support method" do
    Rspec::Core::Configuration.new.should respond_to(:enable_active_record_transactional_support)
  end
  
  describe "helpers for standard Rails23 testing support" do
    Rspec::Core::Configuration.class_eval do
      attr_reader :include_or_extend_modules
    end
    method_to_modules = { :enable_helper_support => Rspec::Rails23::Helpers,
                          :enable_active_record_transactional_support => Rspec::Rails23::TransactionalDatabaseSupport,
                          :enable_controller_support => Rspec::Rails23::Controllers
                        }
    method_to_modules.each do |method, mod| 
      example "##{method} with no filter options" do
        Rspec.configuration.send(method)
        Rspec.configuration.include_or_extend_modules.should include([:extend, mod, {}])
      end
      
      example "##{method} with filter options" do
        filter_options = {:options => { "foo" => "bar" } }
        Rspec.configuration.send(method, filter_options)
        Rspec.configuration.include_or_extend_modules.should include([:extend, mod, filter_options])
      end
    end
    
    example "#enable_Rails23_specific_mocking_extensions for mocha with no filter options" do
      Rspec.configuration.mock_with :mocha
      Rspec.configuration.enable_rails_specific_mocking_extensions
      Rspec.configuration.include_or_extend_modules.should include([:include, Rspec::Rails23::Mocking::WithMocha, {}])
    end

  end

end