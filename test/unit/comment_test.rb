require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  setup do
    @@a = Comment.create(:email=>"myemail", :body=>"mybody")
    @@a1 = Comment.new(:email=>"Comment with email but no body")
    @@a2 = Comment.new(:body=>"Comment with body but no email")
  end
  test "the truth" do
    assert_equal(@@a.respond_to? :article)
  end
  test "check for body" do
     assert_equal false, @@a1.save
  end
  test "check for email" do
     assert_equal false, @@a2.save
  end

end
