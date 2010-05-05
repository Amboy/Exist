require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  # Replace this with your real tests.
   def setup
    @author = authors(:one)
    @author2 = authors(:two)
    @article = articles(:one)
    @comment = comments(:one)
  end

  test "delete owned comments" do
    @article.author = @author
    @article.save
    @article.comments <<  @comment
   assert_difference '@article.comments(true).count', -1 do
     post :destroy, :id => @comment.to_param, :author_id => @author.to_param, :method => :delete
   end
  end
  test "will not delete another comments" do
    @article.author = @author
    @article.save
    @article.comments <<  @comment
   assert_no_difference '@article.comments(true).count' do
     post :destroy, :id => @comment.to_param, :author_id => @author2.to_param, :method => :delete
   end
  end

 def teardown
    Article.delete_all
    Author.delete_all
    Comment.delete_all
  end

end
