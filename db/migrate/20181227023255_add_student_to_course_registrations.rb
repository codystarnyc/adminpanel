class AddStudentToCourseRegistrations < ActiveRecord::Migration[5.2]
  def change
    add_reference :course_registrations, :course, foreign_key: true
    add_reference :course_registrations, :student, foreign_key: true
  end
end
