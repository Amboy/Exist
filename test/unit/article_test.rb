require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  setup do
    @@a = Article.create(:title=>"mytitle", :body=>"mybody", :status=>"Draft")
    @@a1 = Article.new(:title=>"article with title but no body")
    @@a2 = Article.new(:body=>"article with body but no title")
    @@a3 = Article.create(:title=>"mytitle1", :body=>"mybody1", :status=>"Posted")
    @@a4 = Article.create(:title=>"mytitle2", :body=>"mybody2", :status=>"X")
  end
  # Replace this with your real tests.
  test "the truth" do
    assert_equal Array, @@a.comments.class
  end
  test "shoud belong to an author" do
    assert(@@a.respond_to? :author)
  end
  test "check for body" do
    assert_equal false, @@a1.save
  end
  test "check for title" do
    assert_equal false, @@a2.save
  end
  test "status" do
    assert_equal true, @@a3.save
    assert_equal false, @@a4.save
  end
end
