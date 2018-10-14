require 'test_helper'

class GamersSignupTest < ActionDispatch::IntegrationTest
	test "should get signup path" do
  		get signup_path
  		assert_response :success
	end
	test "reject an invalid sign up" do
		get signup_path
		assert_no_difference "Gamer.count" do
			post gamers_path, params: {gamer: {gamername: " ", email: " ", password: "password", password_confirmation: " "}}
		end
		assert_template "gamer/new"
		assert_select "h2.panel-title"
		assert_select "div.panel-body"
	end

  test "accept valid signup" do
    get signup_path
    assert_difference "Gamer.count", 1 do
      post gamers_path, params: { gamer: { gamername: "Paul", 
                email: "udit4666@gmail.com", password: "password",
                              password_confirmation: "password" } }
    end
    follow_redirect!
    assert_template 'gamers/show'
    assert_not flash.empty?
  end
end
