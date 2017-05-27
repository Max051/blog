require 'test_helper'

class PostTest < ActiveSupport::TestCase
def setup
    @post = posts(:postone)
  end

  test "post is valid" do
    assert @post.valid?
  end
  test "post must have content" do
    @post.content = ""
    assert_not @post.valid?
  end
  test "post must have title" do
    @post.title = ""
    assert_not @post.valid?
  end
  test "post don't have to have tags" do
    @post.tags = ""
    assert @post.valid?
  end
end
