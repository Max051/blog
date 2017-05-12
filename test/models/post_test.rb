require 'test_helper'

class PostTest < ActiveSupport::TestCase
def setup
    @admin = admins(:pepe)
    @post = @admin.posts.create({title: "Cool Title",content:"Very Intresting content"})
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
end
