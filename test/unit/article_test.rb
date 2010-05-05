require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  def setup
    @author = authors(:one)
    @author2 = authors(:two)
    @article = articles(:one)
    @comment = comments(:one)
  end

  test "if comment delete" do
    @article.author = @author
    @article.save
    @article.comments <<  @comment
     assert_difference '@article.comments(true).count' , -1 do
      @comment.delete_this_comment(@author) 
     end
  end
  test "if no comment delete" do
    @article.author = @author
    @article.save
    @article.comments <<  @comment
     assert_no_difference '@article.comments(true).count' do
      @comment.delete_this_comment(@author2) 
     end
  end


  def teardown
    Article.delete_all
    Author.delete_all
    Comment.delete_all
  end
  
end
