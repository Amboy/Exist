require 'test_helper'

class AuthorTest < ActiveSupport::TestCase

  def setup
    @author = authors(:one)
  end

  # Associations test
  #
  test "has many articles" do
    assert_equal Array, @author.articles.class
  end

  # Validations test
  test "check for no first name" do
     @author.first_name = nil
     assert_equal false, @author.valid?
  end

  test "check for no last name" do
     @author.first_name = nil
     assert_equal false, @author.valid?
  end

  test "check for no email" do
     @author.email = nil
     assert_equal false, @author.valid?
  end

  test "check for no login" do
     @author.login = nil
     assert_equal false, @author.valid?
  end
  
  def teardown
      Author.delete_all
  end
end
