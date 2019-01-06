class RemoveCohortIsFromStudents < ActiveRecord::Migration[5.2]
  def change
    remove_column :students, :cohort_id, :string
  end
end
