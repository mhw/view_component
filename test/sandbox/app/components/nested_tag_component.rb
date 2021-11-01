# frozen_string_literal: true

class NestedTagComponent < ViewComponent::Base
  def initialize(id:, message:)
    @id = id
    @message = message
  end
end
