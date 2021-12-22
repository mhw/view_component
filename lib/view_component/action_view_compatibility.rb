# frozen_string_literal: true

module ViewComponent
  module ActionViewCompatibility
    def child_contexts
      @_child_contexts ||= []
    end

    def enlist_output_buffer(buf)
      @output_buffer = buf
    end

    def output_buffer=(buf)
      child_contexts.each do |child_context|
        child_context.enlist_output_buffer(buf)
      end
      super
    end
  end
end
