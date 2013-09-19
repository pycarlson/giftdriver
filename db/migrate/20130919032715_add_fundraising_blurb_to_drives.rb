class AddFundraisingBlurbToDrives < ActiveRecord::Migration
  def change
    add_column :drives, :fundraising_blurb, :text
  end
end
