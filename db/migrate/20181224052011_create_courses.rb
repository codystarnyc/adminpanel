class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :title
      t.integer :total_hours
      t.integer :instructor_id
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
