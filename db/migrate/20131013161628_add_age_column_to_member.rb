class AddAgeColumnToMember < ActiveRecord::Migration
  def change
    add_column :family_members, :age, :string
  end
end
