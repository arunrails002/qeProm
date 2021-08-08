require 'test_helper'
class TutorsControllerTest < ActionDispatch::IntegrationTest
	setup do
		@tutor = Tutor.create(name: "Test")
	end

	test "should get index" do
		get tutors_url, as: :json
		assert_response :success
	end

	test "should create tutor when the request is valid" do
		assert_difference('Tutor.count', 1) do
			post tutors_url, {tutor: {name: "Computers"}}
		end
		assert_response 201
	end

	test "should not create tutor when the request is invalid" do
		assert_difference('Tutor.count', 0) do
			post tutors_url, {tutor: {name: " "}}
		end
		assert_response 422
	end	
end