module Rspec
  module Rails23
    
    module Configuration
      
      def rails
        self
      end
      
      # :behaviour => { :describes => lambda { |dt| dt < ActiveRecord::Base }
      def enable_active_record_transactional_support(filter_options={})
        Rspec.configuration.extend(::Rspec::Rails23::TransactionalDatabaseSupport, filter_options)
      end
      
      # :behaviour => { :describes => lambda { |dt| dt.to_s.ends_with?('Helper') }
      def enable_helper_support(filter_options={})
        Rspec.configuration.extend(::Rspec::Rails23::Helpers, filter_options)
      end
      
      # :behaviour => { :describes => lambda { |dt| dt < ActionController::Base } 
      def enable_controller_support(filter_options={})
        Rspec.configuration.extend(::Rspec::Rails23::Controllers, filter_options)
      end
      
      def enable_rails_specific_mocking_extensions(filter_options={})
        case Rspec.configuration.options[:mock_framework].to_s
        when /mocha/i
          require 'rspec/rails23/mocking/with_mocha'
          Rspec.configuration.include(::Rspec::Rails23::Mocking::WithMocha, filter_options)
         when /rr/i
          require 'rspec/rails23/mocking/with_rr'
          Rspec.configuration.include(::Rspec::Rails23::Mocking::WithRR, filter_options)
        end
      end
      
      def enable_reasonable_defaults!
        enable_active_record_transactional_support
        enable_helper_support :behaviour => { :describes => lambda { |dt| dt.to_s.ends_with?('Helper') } }
        enable_controller_support :behaviour => { :describes => lambda { |dt| dt < ::ActionController::Base } }
        enable_rails_specific_mocking_extensions
      end
      
    end
    
  end
end

::Rspec::Core::Configuration.send(:include, ::Rspec::Rails23::Configuration)