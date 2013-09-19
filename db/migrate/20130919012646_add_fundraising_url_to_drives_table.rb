class AddFundraisingUrlToDrivesTable < ActiveRecord::Migration
  def change
    add_column :drives, :fundraising_url, :string
  end
end
