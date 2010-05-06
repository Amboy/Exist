require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  def setup
    @author = authors(:one)
    @author2 = authors(:two)    
    @article = articles(:one)
    @article.author = @author
    @article1 = articles(:two)
    @article1.author = @author2
    @comment = comments(:one)
  end

  # Associations test
  #
  test "associate to author" do
    assert_equal Author, @article.author.class
  end

  test "associate to many comments" do
    assert_equal Array, @article.comments.class
  end

  # Validations test
  #
  test "article was created" do
    @article.author = @author
    assert @article.save
  end

  test "article should not be created since no author" do
    @article.author = nil   
    assert_equal false, @article.save
  end

  test "article should not be created since no title" do
    @article.title = nil
    assert_equal false, @article.save
  end

  test "article should not be created since no body" do
    @article.body = nil   
    assert_equal false, @article.save
  end

  # name scope test
  #
  test "get the latest article" do
    assert_equal [articles(:three), articles(:one)], Article.latest
  end
  # instance method
  test "check if posted" do
    assert_equal true, @article.status == "Posted"
    assert_equal false, @article1.status == "Posted"
  end


  ### FOR CONTROLLER ####
#  test "article was updated" do
#    str = "asdfasdf"
#    @article.body << str
#    assert @article.send(:update)
#  end
 
  test "if comment delete" do    
    @article.save
    @article.comments <<  @comment
     assert_difference '@article.comments(true).count' , -1 do
      @comment.delete_this_comment(@author) 
     end
  end
  test "if no comment delete" do    
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
