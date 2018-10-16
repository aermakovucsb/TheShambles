require 'test_helper'

class GamersLoginTest < ActionDispatch::IntegrationTest
 def setup
    @gamer = Gamer.create!(gamername: "Paul", 
            email: "paul@example.com", password: "password")
  end

test "invalid login is rejected" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { email: " ", 
    password: " " } }
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end
  
  test "valid login credentials accepted and begin session" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { email: @gamer.email, 
                                    password: @gamer.password } }
    assert_redirected_to @gamer
    follow_redirect!
    assert_template 'gamers/show'
    assert_not flash.empty?
  end





end
