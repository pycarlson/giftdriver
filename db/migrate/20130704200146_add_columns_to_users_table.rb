class AddColumnsToUsersTable < ActiveRecord::Migration
  def change
    add_column :users, :full_name, :string
    add_column :users, :zipcode, :string
    add_column :users, :company, :string
  end
end
