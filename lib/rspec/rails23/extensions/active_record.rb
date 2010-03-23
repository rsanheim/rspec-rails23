module Rspec
  module Rails23
    module Extensions
      
      module ActiveRecord
        def errors_on(attribute)
          self.valid?
          [self.errors.on(attribute)].flatten.compact
        end
        alias :error_on :errors_on  
      end
      
    end
  end
end

if defined?(::ActiveRecord::Base)
  ::ActiveRecord::Base.send(:include, ::Rspec::Rails23::Extensions::ActiveRecord)
end