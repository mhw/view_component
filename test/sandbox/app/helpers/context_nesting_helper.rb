# frozen_string_literal: true

module ContextNestingHelper
  def div_tag_from_helper(id, &block)
    tag.div(id: id, &block)
  end
end
