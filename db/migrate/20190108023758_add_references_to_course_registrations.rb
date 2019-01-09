class AddReferencesToCourseRegistrations < ActiveRecord::Migration[5.2]
  def change
    add_reference :course_registrations, :cohort, foreign_key: true
    add_reference :course_registrations, :instructor, foreign_key: true
  end
end
