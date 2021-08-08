require 'test_helper'
class CoursesControllerTest < ActionDispatch::IntegrationTest
	setup do
		@course = Course.create(name: "Test")
	end

	test "should get index" do
		get courses_url, as: :json
		assert_response :success
	end

	test "should create course when the request is valid" do
		assert_difference('Course.count', 1) do
			post courses_url, {course: {name: "Computers"}}
		end
		assert_response 201
	end

	test "should not create course when the request is invalid" do
		assert_difference('Course.count', 0) do
			post courses_url, {course: {name: " "}}
		end
		assert_response 422
	end	

	test "should create course and tutor when the request is valid  " do
		assert_difference('Course.count', 1) do
			assert_difference('Tutor.count', 2) do
				post courses_tutors_url, {course: "maths", tutors:  ["xyz", "tyt"]}
			end
		end
		assert_response 201
	end 

	test "should not create course and tutor when the request is invalid  " do
		assert_difference('Course.count', 0) do
			assert_difference('Tutor.count', 0) do
				post courses_tutors_url, {course: " ", tutors:  []}
			end
		end
		assert_response 422
	end 


	test "should get courses and tutors" do 
		get courses_tutors_url, as: :json
		assert_response :success
	end
end