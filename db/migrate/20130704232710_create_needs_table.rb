class CreateNeedsTable < ActiveRecord::Migration
  def change
    create_table :needs do |t|
      t.text :text
      t.references :family_member
      t.integer :priority
    end
  end
end
