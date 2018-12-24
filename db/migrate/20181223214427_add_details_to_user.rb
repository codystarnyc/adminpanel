class AddDetailsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string, before: :last_name
    add_column :users, :last_name, :string, before: :email
  end
end
