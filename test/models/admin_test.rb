require 'test_helper'

class AdminTest < ActiveSupport::TestCase
def setup
  @admin = admins(:pepe)
  @fakeadmin = Admin.create({email: 'aaa@c.s'})
end
test "is_admin_valid" do
  assert @admin.valid?
end
test "is second admin valid" do
  assert_not @fakeadmin.valid?
end
test "admin must have email" do
  @admin.email = nil
  assert_not @admin.valid?
end

end
