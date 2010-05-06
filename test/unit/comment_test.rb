require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  
  def setup
    @comment = comments(:one)
  end

  #Associations test
  #
  test "belongs to article" do
    assert Article, @comment.article.class
  end

  # Validations test
  #
  test "valid comment" do
    assert @comment.valid?
  end

  test "check for body" do
    @comment.body = nil
    assert_equal false, @comment.valid?
  end
  
  test "check for email" do
    @comment.email = nil
    assert_equal false, @comment.valid?
  end
  
  def teardown
    Comment.delete_all
  end

end
