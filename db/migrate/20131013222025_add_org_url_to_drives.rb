class AddOrgUrlToDrives < ActiveRecord::Migration
  def change
    add_column :drives, :org_website_url, :string
  end
end
