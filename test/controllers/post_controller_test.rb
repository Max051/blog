require 'test_helper'

class PostsControllerTest < ActionController::TestCase
   include Devise::Test::ControllerHelpers

def setup
  @admin = admins(:pepe)
  @admin.confirm
  @post = posts(:postone)
end
test "should get new when admin is logged in" do
  @request.env['devise.mapping'] = Devise.mappings[:admin]

  sign_in @admin

  get :new

  assert_response :success
end
test "should redirect new when  admin is not logged in" do

  get :new

  assert_redirected_to new_admin_session_path
end
test "should get edit when admin is logged in" do
  @request.env['devise.mapping'] = Devise.mappings[:admin]

  sign_in @admin

  get :edit, id: @post.id

  assert_response :success
end

test "should get all posts" do

  get :index

  assert_response :success
end
test "create post" do
  post :create, post: {title:@post.title,content:@post.content}
  assert_not flash.empty?
  assert_redirected_to new_admin_session_path
end
test "update post" do
patch :update, id: @post.id , post: {title:@post.title,content:@post.content}
assert_not flash.empty?
assert_redirected_to root_url
end


end
