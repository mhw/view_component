# frozen_string_literal: true

module ViewComponent
  module ActionViewCompatibility
    def child_contexts
      @_child_contexts ||= []
    end

    def with_output_buffer(buf = nil, &block)
      children = child_contexts
      if children.empty?
        super
      else
        buf = ActionView::OutputBuffer.new
        enlist_children = children.reverse.inject(block) { |proc, child_context|
          Proc.new { child_context.enlist_output_buffer(buf, &proc) }
        }
        super(buf, &enlist_children)
      end
    end
  end
end
