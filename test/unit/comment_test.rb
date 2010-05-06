require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  
  def setup
    @comment = comments(:one)
    @author = authors(:one)
    @author2 = authors(:two)
    @article = articles(:one)
    @article.author = @author
    @article.comments <<  @comment
    @article.save
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
  
  test "if comment delete" do
     assert_difference '@article.comments(true).count' , -1 do
      @comment.delete_this_comment(@author)
     end
  end
  test "if no comment delete" do
     assert_no_difference '@article.comments(true).count' do
      @comment.delete_this_comment(@author2)
     end
  end
  def teardown
    Comment.delete_all
    Author.delete_all
    Article.delete_all
  end
end
