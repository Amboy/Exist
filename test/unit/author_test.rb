require 'test_helper'

class AuthorTest < ActiveSupport::TestCase

  # Replace this with your real tests.
  def setup
    @correct = Author.create(:last_name => "Suarez", :first_name => "Amboy")
    @incorrect1 = Author.new(:last_name => "fgsfds")
    @incorrect2 = Author.new(:first_name => "fgsfds")
  end

  test "the truth" do
    #assert true
    assert_equal Array, @correct.articles.class
  end

  test "check for first name" do
     #assert true
     assert_equal false, @incorrect1.valid?
  end

  test "check for last name" do
     #assert true
     assert_equal false, @incorrect2.valid?
  end

  test "if last name is nil" do
     @correct.last_name = nil
     assert_equal false, @correct.valid?
     assert_equal true, @correct.errors.invalid?(:last_name)
  end

  test "if first name is nil" do
     @correct.first_name = nil
     assert_equal false, @correct.valid?
     assert_equal true, @correct.errors.invalid?(:first_name)
  end

  test "if password fail" do
    @correct.password = nil
    assert_equal false, @correct.valid?
    assert_equal true, @correct.errors.invalid?(:password)
  end


end
