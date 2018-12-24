class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.string :education
      t.bigint :cohort_id
      t.datetime :created_at
      t.datetime :updated_at
      t.string :cohort_id

      t.timestamps
    end
    add_index :students, :cohort_id
  end
end
