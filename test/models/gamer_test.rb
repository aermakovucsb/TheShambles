require 'test_helper'

class GamerTest < ActiveSupport::TestCase
  
  def setup
    @gamer = Gamer.new(gamername: "Paul", email: "paul@example.com", password: "password", password_confirmation:"password")
  end
  
  test "should be valid" do
    assert @gamer.valid?
  end
  
  test "name should be present" do
    @gamer.gamername = " "
    assert_not @gamer.valid?
  end
  
  test "name should be less than 30 characters" do
    @gamer.gamername = "a" * 31
    assert_not @gamer.valid?
  end
  
  test "email should be present" do
    @gamer.email = " "
    assert_not @gamer.valid?
  end
  
  test "email should not be too long" do
    @gamer.email = "a" * 245 + "@example.com"
    assert_not @gamer.valid?
  end
  
  test "email should accept correct format" do
    valid_emails = %w[user@example.com paul@gmail.com M.first@yahoo.ca john+smith@co.uk.org]
    valid_emails.each do |valids|
      @gamer.email = valids
      assert @gamer.valid?, "#{valids.inspect} should be valid"
    end
  end
  
  test "should reject invalid addresses" do
    invalid_emails = %w[paul@example paul@example,com paul.name@gmail. joe@bar+foo.com]
    invalid_emails.each do |invalids|
      @gamer.email = invalids
      assert_not @gamer.valid?, "#{invalids.inspect} should be invalid"
    end
  end 
  
  test "email should be unique and case insensitive" do
    duplicate_gamer = @gamer.dup
    duplicate_gamer.email = @gamer.email.upcase
    @gamer.save
    assert_not duplicate_gamer.valid?
  end
  test "email should be lower case before hitting db" do
    mixed_email = "JohN@ExampLe.com"
    @gamer.email = mixed_email
    @gamer.save
    assert_equal mixed_email.downcase, @gamer.reload.email 
  end
    test "password should be present" do
    @gamer.password = @gamer.password_confirmation = " "
    assert_not @gamer.valid?
  end
  
  test "password should be atleast 5 character" do
    @gamer.password = @gamer.password_confirmation = "x" * 4
    assert_not @gamer.valid?
  end
  

  
end