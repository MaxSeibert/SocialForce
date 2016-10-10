class AddIsVolunteerToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :is_volunteer, :boolean
  end
end
