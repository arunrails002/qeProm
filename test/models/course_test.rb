require 'test_helper'
class CourseTest < ActiveSupport::TestCase

	def setup
		@course = Course.new(name: "test")
	end

	test "course should be valid" do
		assert @course.valid?
	end

	test "name should be present" do
		@course.name = " "
		assert_not @course.valid?
	end

	test "name should be uniq" do
		@course.save
		@course2 = Course.new(name: "test")
		assert_not @course2.valid?
	end

	test " name should not be too long" do
		@course.name = "a" * 15
		assert_not @course.valid?
	end

	test " name should not be too short" do
		@course.name = "aa"
		assert_not @course.valid?
	end	
end