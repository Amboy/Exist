require 'test_helper'

class AuthorTest < ActiveSupport::TestCase

  def setup
    @author = authors(:one)
    @author1 = authors(:two)
    @author2 = authors(:three)
  end

  # Associations test
  #
  test "has many articles" do
    assert_equal Array, @author.articles.class
  end

  # Validations test
  #
  test "valid author" do
    puts @author1.inspect
    assert @author1.save
  end
  
  def teardown
    Author.delete_all
  end

end
