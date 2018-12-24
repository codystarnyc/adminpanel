class CreateCourseRegistrations < ActiveRecord::Migration[5.2]
  def change
    create_table :course_registrations do |t|
      t.bigint :course_id
      t.bigint :student_id
      t.datetime :created_at
      t.datetime :updated_at
      t.string :course_id
      t.string :course_id
      t.string :student_id

      t.timestamps
    end
    add_index :course_registrations, :course_id
    # add_index :course_registrations, :course_id
    add_index :course_registrations, :student_id
  end
end
