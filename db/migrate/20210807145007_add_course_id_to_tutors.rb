class AddCourseIdToTutors < ActiveRecord::Migration
  def change
    add_column :tutors, :course_id, :integer
  end
end
