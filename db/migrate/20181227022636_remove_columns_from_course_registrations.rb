class RemoveColumnsFromCourseRegistrations < ActiveRecord::Migration[5.2]
  def change
    remove_column :course_registrations, :course_id, :bigint
    remove_column :course_registrations, :student_id, :bigint
    remove_column :course_registrations, :created_at, :datetime
    remove_column :course_registrations, :updated_at, :datetime
    remove_column :course_registrations, :course_id, :string
    remove_column :course_registrations, :course_id, :string
    remove_column :course_registrations, :student_id, :string
  end
end
