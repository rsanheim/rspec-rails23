require File.expand_path(File.dirname(__FILE__) + "/../../../spec_helper")

describe RSpec::Core::Configuration do

  example "loading rspec rails23 includes it in the configuration class" do
    RSpec::Core::Configuration.included_modules.should include(Rspec::Rails23::Configuration)
  end
  
  it "adds a #rails method" do
    RSpec::Core::Configuration.new.should respond_to(:rails)
  end
  
  it "adds an #enable_active_record_transactional_support method" do
    RSpec::Core::Configuration.new.should respond_to(:enable_active_record_transactional_support)
  end
  
  describe "helpers for standard Rails23 testing support" do
    method_to_modules = { :enable_helper_support => Rspec::Rails23::Helpers,
                          :enable_active_record_transactional_support => Rspec::Rails23::TransactionalDatabaseSupport,
                          :enable_controller_support => Rspec::Rails23::Controllers
                        }
    method_to_modules.each do |method, mod| 
      example "##{method} with no filter options" do
        RSpec.configuration.send(method)
        RSpec.configuration.include_or_extend_modules.should include([:extend, mod, {}])
      end
      
      example "##{method} with filter options" do
        filter_options = {:options => { "foo" => "bar" } }
        RSpec.configuration.send(method, filter_options)
        RSpec.configuration.include_or_extend_modules.should include([:extend, mod, filter_options])
      end
    end
    
    example "#enable_Rails23_specific_mocking_extensions for mocha with no filter options" do
      RSpec.configuration.mock_with :mocha
      RSpec.configuration.enable_rails_specific_mocking_extensions
      RSpec.configuration.include_or_extend_modules.should include([:include, Rspec::Rails23::Mocking::WithMocha, {}])
    end

  end

end
