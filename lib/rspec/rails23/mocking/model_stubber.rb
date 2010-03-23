module Rspec
  module Rails23
    module Mocking

      module ModelStubber

        def connection
          raise ::Rspec::Rails23::IllegalDataAccessException.new("stubbed/mocked models are not allowed to access the database")
        end

        def new_record?
          id.nil?
        end

        def as_new_record
          self.id = nil
          self
        end

      end

    end
  end
end