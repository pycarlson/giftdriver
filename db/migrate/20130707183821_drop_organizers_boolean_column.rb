class DropOrganizersBooleanColumn < ActiveRecord::Migration
  def change
    remove_column :organizers, :organizer
  end
end
