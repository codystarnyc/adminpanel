class CreateCourseRegistrations < ActiveRecord::Migration[5.2]
  def change
    create_table :course_registrations do |t| 
      t.bigint :student_id
      t.bigint :cohort_id
      t.bigint :instructor_id
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
    add_index :course_registrations, :course_id
    # add_index :course_registrations, :course_id
    add_index :course_registrations, :student_id
  end
end
