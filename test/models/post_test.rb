require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "post is valid when all props are specified" do
    assert build(:post, :about_design).valid?
  end

  test "post without topic fails validation" do
    refute build(:post).valid?
  end

  test "post with empty title fails validation" do
    refute build(:post, :about_story, title: "").valid?
  end

  test "post with empty body fails validation" do
    refute build(:post, :about_design, body: "").valid?
  end

  test "post with too long title fails validation" do
    refute build(:post, :about_design, title: "x" * 301).valid?
  end
end
