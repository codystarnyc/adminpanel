class RemoveCourseIdFromCourseRegistrations < ActiveRecord::Migration[5.2]
  def change
    remove_column :course_registrations, :course_id, :integer
  end
end
