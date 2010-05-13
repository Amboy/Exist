require 'test_helper'

class LikeTest < ActiveSupport::TestCase
  def setup    
    @like = likes(:one)
    
  end

  test "belongs to author" do
    assert_equal Author, @like.author.class
  end

  test "belongs to article" do
    assert_equal Article, @like.article.class
  end

  test "liked by multiple authors" do
    @article = articles(:one)
    assert @article.likes
    assert_equal Array, @article.fav_authors.class
  end

  test "liked by multiple articles" do
    @author = authors(:one)
    assert @author.likes
    assert_equal Array, @author.fav_articles.class
  end

  def teardown
    Like.delete_all
    Article.delete_all
    Author.delete_all
  end
end
