require 'test_helper'
class TutorTest < ActiveSupport::TestCase

	def setup
		@tutor = Tutor.new(name: "test")
	end

	test "tutor should be valid" do
		assert @tutor.valid?
	end

	test "name should be present" do
		@tutor.name = " "
		assert_not @tutor.valid?
	end

	test "name should be uniq" do
		@tutor.save
		@tutor2 = Tutor.new(name: "test")
		assert_not @tutor2.valid?
	end

	test " name should not be too long" do
		@tutor.name = "a" * 15
		assert_not @tutor.valid?
	end

	test " name should not be too short" do
		@tutor.name = "aa"
		assert_not @tutor.valid?
	end	
end