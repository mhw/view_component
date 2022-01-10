# frozen_string_literal: true

require "test_helper"

class ViewComponent::ContextNestingTest < ViewComponent::TestCase
  def test_renders_tag_helper_with_capture_correctly
    render_inline(NestedTagComponent.new(id: "container", message: "Hello"))

    refute_selector("span + div#container", text: "</span>")
    assert_selector("div#container > span", text: "Hello")
  end

  def test_renders_partial_with_component_correctly
    render_inline(NestedPartialComponent.new)

    assert_text("npc{ np{ ncc{ }ncc }np }npc", normalize_ws: true)
  end
end
