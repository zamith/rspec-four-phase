module RSpec
  module Core
    module Hooks
      def before(*args, &block)
        if in_spec_dir?(self.send(:caller))
          info_message("before")
        else
          register_hook :append, :before, *args, &block
        end
      end

      def after(*args, &block)
        if in_spec_dir?(self.send(:caller))
          info_message("after")
        else
          register_hook :prepend, :after, *args, &block
        end
      end

      def around(*args, &block)
        if in_spec_dir?(self.send(:caller))
          info_message("around")
        else
          register_hook :prepend, :around, *args, &block
        end
      end

      private

      def in_spec_dir?(trace)
        trace.first.match(/\/spec\//)
      end

      def info_message(type)
        Rspec::FourPhase.log.info "You should not use #{type} blocks. Use methods that you call explicitly, instead."
      end
    end
  end
end
