require 'test_helper'

class AuthorTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  setup do
    @@a = Author.create(:last_name=>"Suarez", :first_name=>"Amboy")
    @@a1 = Author.new(:last_name=>"fgsfds")
    @@a2 = Author.new(:first_name>"fgsfds")
  end
  test "the truth" do
    #assert true
    assert_equal Array, @@a.articles.class
  end
  test "check for first name" do
     #assert true
     assert_equal false, @@a1.save
  end
  test "check for last name" do
     #assert true
     assert_equal false, @@a2.save
  end
end
